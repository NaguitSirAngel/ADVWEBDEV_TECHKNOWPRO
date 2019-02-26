using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechKnowPro.Model
{
    public class Incident
    {
        public string incident_id { get; set; }
        public string customer_id { get; set; }
        public string user_id { get; set; }
        public string datetime { get; set; }
        public string status { get; set; }
        public string description { get; set; }
        public string contact_method { get; set; }
        public string product_name { get; set; }
        
    }
}