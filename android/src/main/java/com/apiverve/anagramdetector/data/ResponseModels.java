// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     AnagramDetectorData data = Converter.fromJsonString(jsonString);

package com.apiverve.anagramdetector.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static AnagramDetectorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(AnagramDetectorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(AnagramDetectorData.class);
        writer = mapper.writerFor(AnagramDetectorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// AnagramDetectorData.java

package com.apiverve.anagramdetector.data;

import com.fasterxml.jackson.annotation.*;

public class AnagramDetectorData {
    private String text1;
    private String text2;
    private boolean isAnagram;
    private String cleanedText1;
    private String cleanedText2;
    private String sortedText1;
    private String sortedText2;
    private long lengthText1;
    private long lengthText2;
    private CharacterFrequencyText1 characterFrequencyText1;
    private CharacterFrequencyText1 characterFrequencyText2;
    private CharacterFrequencyText1 commonCharacters;
    private UniqueToText uniqueToText1;
    private UniqueToText uniqueToText2;
    private long similarityPercentage;
    private Options options;

    @JsonProperty("text1")
    public String getText1() { return text1; }
    @JsonProperty("text1")
    public void setText1(String value) { this.text1 = value; }

    @JsonProperty("text2")
    public String getText2() { return text2; }
    @JsonProperty("text2")
    public void setText2(String value) { this.text2 = value; }

    @JsonProperty("is_anagram")
    public boolean getIsAnagram() { return isAnagram; }
    @JsonProperty("is_anagram")
    public void setIsAnagram(boolean value) { this.isAnagram = value; }

    @JsonProperty("cleaned_text1")
    public String getCleanedText1() { return cleanedText1; }
    @JsonProperty("cleaned_text1")
    public void setCleanedText1(String value) { this.cleanedText1 = value; }

    @JsonProperty("cleaned_text2")
    public String getCleanedText2() { return cleanedText2; }
    @JsonProperty("cleaned_text2")
    public void setCleanedText2(String value) { this.cleanedText2 = value; }

    @JsonProperty("sorted_text1")
    public String getSortedText1() { return sortedText1; }
    @JsonProperty("sorted_text1")
    public void setSortedText1(String value) { this.sortedText1 = value; }

    @JsonProperty("sorted_text2")
    public String getSortedText2() { return sortedText2; }
    @JsonProperty("sorted_text2")
    public void setSortedText2(String value) { this.sortedText2 = value; }

    @JsonProperty("length_text1")
    public long getLengthText1() { return lengthText1; }
    @JsonProperty("length_text1")
    public void setLengthText1(long value) { this.lengthText1 = value; }

    @JsonProperty("length_text2")
    public long getLengthText2() { return lengthText2; }
    @JsonProperty("length_text2")
    public void setLengthText2(long value) { this.lengthText2 = value; }

    @JsonProperty("character_frequency_text1")
    public CharacterFrequencyText1 getCharacterFrequencyText1() { return characterFrequencyText1; }
    @JsonProperty("character_frequency_text1")
    public void setCharacterFrequencyText1(CharacterFrequencyText1 value) { this.characterFrequencyText1 = value; }

    @JsonProperty("character_frequency_text2")
    public CharacterFrequencyText1 getCharacterFrequencyText2() { return characterFrequencyText2; }
    @JsonProperty("character_frequency_text2")
    public void setCharacterFrequencyText2(CharacterFrequencyText1 value) { this.characterFrequencyText2 = value; }

    @JsonProperty("common_characters")
    public CharacterFrequencyText1 getCommonCharacters() { return commonCharacters; }
    @JsonProperty("common_characters")
    public void setCommonCharacters(CharacterFrequencyText1 value) { this.commonCharacters = value; }

    @JsonProperty("unique_to_text1")
    public UniqueToText getUniqueToText1() { return uniqueToText1; }
    @JsonProperty("unique_to_text1")
    public void setUniqueToText1(UniqueToText value) { this.uniqueToText1 = value; }

    @JsonProperty("unique_to_text2")
    public UniqueToText getUniqueToText2() { return uniqueToText2; }
    @JsonProperty("unique_to_text2")
    public void setUniqueToText2(UniqueToText value) { this.uniqueToText2 = value; }

    @JsonProperty("similarity_percentage")
    public long getSimilarityPercentage() { return similarityPercentage; }
    @JsonProperty("similarity_percentage")
    public void setSimilarityPercentage(long value) { this.similarityPercentage = value; }

    @JsonProperty("options")
    public Options getOptions() { return options; }
    @JsonProperty("options")
    public void setOptions(Options value) { this.options = value; }
}

// CharacterFrequencyText1.java

package com.apiverve.anagramdetector.data;

import com.fasterxml.jackson.annotation.*;

public class CharacterFrequencyText1 {
    private long l;
    private long i;
    private long s;
    private long t;
    private long e;
    private long n;

    @JsonProperty("l")
    public long getL() { return l; }
    @JsonProperty("l")
    public void setL(long value) { this.l = value; }

    @JsonProperty("i")
    public long getI() { return i; }
    @JsonProperty("i")
    public void setI(long value) { this.i = value; }

    @JsonProperty("s")
    public long getS() { return s; }
    @JsonProperty("s")
    public void setS(long value) { this.s = value; }

    @JsonProperty("t")
    public long getT() { return t; }
    @JsonProperty("t")
    public void setT(long value) { this.t = value; }

    @JsonProperty("e")
    public long getE() { return e; }
    @JsonProperty("e")
    public void setE(long value) { this.e = value; }

    @JsonProperty("n")
    public long getN() { return n; }
    @JsonProperty("n")
    public void setN(long value) { this.n = value; }
}

// Options.java

package com.apiverve.anagramdetector.data;

import com.fasterxml.jackson.annotation.*;

public class Options {
    private boolean ignoreCase;
    private boolean ignoreSpaces;

    @JsonProperty("ignore_case")
    public boolean getIgnoreCase() { return ignoreCase; }
    @JsonProperty("ignore_case")
    public void setIgnoreCase(boolean value) { this.ignoreCase = value; }

    @JsonProperty("ignore_spaces")
    public boolean getIgnoreSpaces() { return ignoreSpaces; }
    @JsonProperty("ignore_spaces")
    public void setIgnoreSpaces(boolean value) { this.ignoreSpaces = value; }
}

// UniqueToText.java

package com.apiverve.anagramdetector.data;

import com.fasterxml.jackson.annotation.*;

@JsonAutoDetect(fieldVisibility=JsonAutoDetect.Visibility.NONE)
public class UniqueToText {
}