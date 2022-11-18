﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YCM.CLO.DataAccess.Models
{
    public class TopBottomPriceMovers
    {
        public bool IsStale { get; set; }
        public string Prev5BusinessDay { get; set; }
        public IEnumerable<vw_PriceMove> PrevDayTop { get; set; }
        public IEnumerable<vw_PriceMove> PrevDayBottom { get; set; }
        public IEnumerable<vw_PriceMove> Prev5DayTop { get; set; }
        public IEnumerable<vw_PriceMove> Prev5DayBottom { get; set; }
    }
}
