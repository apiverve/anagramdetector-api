declare module '@apiverve/anagramdetector' {
  export interface anagramdetectorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface anagramdetectorResponse {
    status: string;
    error: string | null;
    data: AnagramDetectorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface AnagramDetectorData {
      text1:                null | string;
      text2:                null | string;
      isAnagram:            boolean | null;
      cleanedText1:         null | string;
      cleanedText2:         null | string;
      sortedText1:          null | string;
      sortedText2:          null | string;
      lengthText1:          number | null;
      lengthText2:          number | null;
      similarityPercentage: number | null;
  }

  export default class anagramdetectorWrapper {
    constructor(options: anagramdetectorOptions);

    execute(callback: (error: any, data: anagramdetectorResponse | null) => void): Promise<anagramdetectorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: anagramdetectorResponse | null) => void): Promise<anagramdetectorResponse>;
    execute(query?: Record<string, any>): Promise<anagramdetectorResponse>;
  }
}
