﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Commodity.Core.Entities;

public partial class CropDimension
{
    public int Id { get; set; }

    public string CropName { get; set; }

    public string Image { get; set; }

    public string AdvisoryImg { get; set; }

    public virtual ICollection<_2dcropPrice> _2dcropPrices { get; set; } = new List<_2dcropPrice>();
}