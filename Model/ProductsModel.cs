using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssignmentNew.Model
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public long ProductPrice { get; set; }
        public string ProductImage { get; set; }
        public bool? UserSelectedProduct { get; set; }

    }
}