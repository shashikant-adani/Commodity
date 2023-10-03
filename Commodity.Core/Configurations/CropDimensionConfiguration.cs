﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Commodity.Core;
using Commodity.Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;

namespace Commodity.Core.Configurations
{
    public partial class CropDimensionConfiguration : IEntityTypeConfiguration<CropDimension>
    {
        public void Configure(EntityTypeBuilder<CropDimension> entity)
        {
            entity.HasKey(e => e.Id).HasName("crop_pkey");

            entity.Property(e => e.AdvisoryImg).HasColumnName("advisory_img");
            entity.Property(e => e.CropName).HasColumnName("crop_name");
            entity.Property(e => e.Image).HasColumnName("image");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<CropDimension> entity);
    }
}