// Package anagramdetector provides a Go client for the Anagram Detector API.
//
// For more information, visit: https://apiverve.com/marketplace/anagramdetector?utm_source=go&utm_medium=readme
package anagramdetector

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the Anagram Detector API.
//
// Parameters:
//   - text1 (required): string - The first text to compare
//   - text2 (required): string - The second text to compare
//   - ignorecase: boolean - Ignore case when comparing (default: true)
//   - ignorespaces: boolean - Ignore spaces when comparing (default: true)
type Request struct {
	Text1 string `json:"text1"` // Required
	Text2 string `json:"text2"` // Required
	Ignorecase bool `json:"ignorecase,omitempty"` // Optional
	Ignorespaces bool `json:"ignorespaces,omitempty"` // Optional
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"text1": {Type: "string", Required: true},
		"text2": {Type: "string", Required: true},
		"ignorecase": {Type: "boolean", Required: false},
		"ignorespaces": {Type: "boolean", Required: false},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the Anagram Detector API.
type ResponseData struct {
	Text1 string `json:"text1"`
	Text2 string `json:"text2"`
	IsAnagram bool `json:"is_anagram"`
	CleanedText1 string `json:"cleaned_text1"`
	CleanedText2 string `json:"cleaned_text2"`
	SortedText1 string `json:"sorted_text1"`
	SortedText2 string `json:"sorted_text2"`
	LengthText1 int `json:"length_text1"`
	LengthText2 int `json:"length_text2"`
	CharacterFrequencyText1 CharacterFrequencyText1Data `json:"character_frequency_text1"`
	CharacterFrequencyText2 CharacterFrequencyText2Data `json:"character_frequency_text2"`
	CommonCharacters CommonCharactersData `json:"common_characters"`
	UniqueToText1 UniqueToText1Data `json:"unique_to_text1"`
	UniqueToText2 UniqueToText2Data `json:"unique_to_text2"`
	SimilarityPercentage int `json:"similarity_percentage"`
	Options OptionsData `json:"options"`
}

// CharacterFrequencyText1Data represents the character_frequency_text1 object.
type CharacterFrequencyText1Data struct {
	L int `json:"l"`
	I int `json:"i"`
	S int `json:"s"`
	T int `json:"t"`
	E int `json:"e"`
	N int `json:"n"`
}

// CharacterFrequencyText2Data represents the character_frequency_text2 object.
type CharacterFrequencyText2Data struct {
	S int `json:"s"`
	I int `json:"i"`
	L int `json:"l"`
	E int `json:"e"`
	N int `json:"n"`
	T int `json:"t"`
}

// CommonCharactersData represents the common_characters object.
type CommonCharactersData struct {
	L int `json:"l"`
	I int `json:"i"`
	S int `json:"s"`
	T int `json:"t"`
	E int `json:"e"`
	N int `json:"n"`
}

// UniqueToText1Data represents the unique_to_text1 object.
type UniqueToText1Data struct {

}

// UniqueToText2Data represents the unique_to_text2 object.
type UniqueToText2Data struct {

}

// OptionsData represents the options object.
type OptionsData struct {
	IgnoreCase bool `json:"ignore_case"`
	IgnoreSpaces bool `json:"ignore_spaces"`
}
