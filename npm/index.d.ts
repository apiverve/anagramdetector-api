declare module '@apiverve/anagramdetector' {
  export interface anagramdetectorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface anagramdetectorResponse {
    status: string;
    error: string | null;
    data: AnagramDetectorData;
    code?: number;
  }


  interface AnagramDetectorData {
      text1:                   string;
      text2:                   string;
      isAnagram:               boolean;
      cleanedText1:            string;
      cleanedText2:            string;
      sortedText1:             string;
      sortedText2:             string;
      lengthText1:             number;
      lengthText2:             number;
      characterFrequencyText1: CharacterFrequencyText1;
      characterFrequencyText2: CharacterFrequencyText1;
      commonCharacters:        CharacterFrequencyText1;
      uniqueToText1:           UniqueToText;
      uniqueToText2:           UniqueToText;
      similarityPercentage:    number;
      options:                 Options;
  }
  
  interface CharacterFrequencyText1 {
      l: number;
      i: number;
      s: number;
      t: number;
      e: number;
      n: number;
  }
  
  interface Options {
      ignoreCase:   boolean;
      ignoreSpaces: boolean;
  }
  
  interface UniqueToText {
  }

  export default class anagramdetectorWrapper {
    constructor(options: anagramdetectorOptions);

    execute(callback: (error: any, data: anagramdetectorResponse | null) => void): Promise<anagramdetectorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: anagramdetectorResponse | null) => void): Promise<anagramdetectorResponse>;
    execute(query?: Record<string, any>): Promise<anagramdetectorResponse>;
  }
}
