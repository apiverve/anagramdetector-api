using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.AnagramDetector
{
    /// <summary>
    /// Query options for the Anagram Detector API
    /// </summary>
    public class AnagramDetectorQueryOptions
    {
        /// <summary>
        /// The first text to compare
        /// </summary>
        [JsonProperty("text1")]
        public string Text1 { get; set; }

        /// <summary>
        /// The second text to compare
        /// </summary>
        [JsonProperty("text2")]
        public string Text2 { get; set; }

        /// <summary>
        /// Ignore case when comparing (default: true)
        /// </summary>
        [JsonProperty("ignorecase")]
        public string Ignorecase { get; set; }

        /// <summary>
        /// Ignore spaces when comparing (default: true)
        /// </summary>
        [JsonProperty("ignorespaces")]
        public string Ignorespaces { get; set; }
    }
}
