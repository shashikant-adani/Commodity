
CREATE TABLE [dbo].[2DCropPrices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Retail] [varchar](max) NULL,
	[Wholesale] [varchar](max) NULL,
	[Date] [datetime2](7) NULL,
	[CropDimensionId] [int] NULL,
	[StateDimensionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CropDimensions]    Script Date: 04-Oct-23 11:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CropDimensions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[crop_name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[advisory_img] [nvarchar](max) NULL,
 CONSTRAINT [cropD_pkey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateDimensions]    Script Date: 04-Oct-23 11:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateDimensions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](max) NULL,
	[ShortCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CropDimensions] ON 

INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (2, N'Groundnut Oil (Packed)', N'Crops/prices/groundnut-oil.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (3, N'Garlic', N'Crops/garlic.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (4, N'Blackgram', N'Crops/blackgram.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (5, N'Masoor Dal', N'Crops/prices/moong-dal.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (6, N'Maize', N'Crops/maize.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (7, N'Mustard', N'Crops/mustard.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (8, N'Gram Dal', N'Crops/prices/gram-dal.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (9, N'Sorghum', N'Crops/sorghum.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (10, N'Vanaspati (Packed)', N'Crops/prices/vanaspati.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (11, N'Sugarcane', N'Crops/sugarcane.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (12, N'Palm Oil (Packed)', N'Crops/prices/palm-oil.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (13, N'Potato', N'Crops/potato.svg', N'https://megaapi.ugdev.tech/files/test_bk_ug1/Crops/potatoo.png')
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (14, N'Tea Loose', N'Crops/prices/tea-loose.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (15, N'Rice', N'Crops/prices/rice.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (16, N'Sunflower Oil (Packed)', N'Crops/prices/sunflower-oil.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (17, N'Soyabean', N'Crops/soybean.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (18, N'Sugar', N'Crops/sugar.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (19, N'Soya Oil (Packed)', N'Crops/soya-oil.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (20, N'Salt Pack (Iodised)', N'Crops/prices/salt.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (21, N'Wheat', N'Crops/wheat.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (22, N'Green moong', N'Crops/green-moong.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (23, N'Gur', N'Crops/prices/gur.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (24, N'Chilli', N'Crops/chilli.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (25, N'Urad Dal', N'Crops/prices/urad-dal.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (26, N'Moong Dal', N'Crops/prices/moong-dal.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (27, N'Cotton', N'Crops/cotton.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (28, N'Milk @', N'Crops/prices/milk.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (29, N'Groundnut', N'Crops/groundnut.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (30, N'Paddy', N'Crops/paddy.svg', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (31, N'Mustard Oil (Packed)', N'Crops/prices/mustard-oil.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (32, N'Onion', N'Crops/onion.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (33, N'Tomato', N'Crops/tomato.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (34, N'Atta (Wheat)', N'Crops/prices/atta.png', NULL)
INSERT [dbo].[CropDimensions] ([Id], [crop_name], [image], [advisory_img]) VALUES (35, N'Tur/Arhar Dal', N'Crops/prices/arhar-dal.png', NULL)
SET IDENTITY_INSERT [dbo].[CropDimensions] OFF
GO
SET IDENTITY_INSERT [dbo].[StateDimensions] ON 

INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (1, N'Andaman and Nicobar', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (2, N'Andhra Pradesh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (3, N'Arunachal pradesh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (4, N'Assam', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (5, N'Bihar', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (6, N'Chandigarh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (7, N'Chhattisgarh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (8, N'Delhi', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (9, N'DNH and DD', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (10, N'Goa', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (11, N'Gujarat', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (12, N'Haryana', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (13, N'Himachal Pradesh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (14, N'Jammu and Kashmir', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (15, N'Jharkhand', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (16, N'Karnataka', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (17, N'Kerala', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (18, N'Madhya Pradesh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (19, N'Maharashtra', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (20, N'Meghalaya', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (21, N'Mizoram', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (22, N'Nagaland', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (23, N'Odisha', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (24, N'Puducherry', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (25, N'Punjab', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (26, N'Rajasthan', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (27, N'Sikkim', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (28, N'Tamil Nadu', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (29, N'Telangana', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (30, N'Tripura', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (31, N'Uttar Pradesh', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (32, N'Uttarakhand', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (33, N'West Bengal', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (34, N'Average Price', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (35, N'Maximum Price', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (36, N'Minimum Price', NULL)
INSERT [dbo].[StateDimensions] ([Id], [state_name], [ShortCode]) VALUES (37, N'Modal Price', NULL)
SET IDENTITY_INSERT [dbo].[StateDimensions] OFF
GO
ALTER TABLE [dbo].[2DCropPrices]  WITH CHECK ADD FOREIGN KEY([CropDimensionId])
REFERENCES [dbo].[CropDimensions] ([Id])
GO
ALTER TABLE [dbo].[2DCropPrices]  WITH CHECK ADD FOREIGN KEY([StateDimensionId])
REFERENCES [dbo].[StateDimensions] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCropPriceBySateDate]    Script Date: 04-Oct-23 11:31:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCropPriceBySateDate]
(@Id INT,
@Date datetime2)
AS
BEGIN
SELECT
    cd.image,
    cd.crop_name,
	MAX(CASE WHEN cp.StateDimensionId = @Id THEN sd.state_name END) AS State_Name,
    MAX(CASE WHEN cp.StateDimensionId = @Id THEN cp.Retail END) AS Retail,
    MAX(CASE WHEN cp.StateDimensionId = 34 THEN cp.Retail END) AS Average_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 35 THEN cp.Retail END) AS Maximum_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 36 THEN cp.Retail END) AS Minimum_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 37 THEN cp.Retail END) AS Modal_Retail,
    MAX(CASE WHEN cp.StateDimensionId = @Id THEN cp.Wholesale END) AS Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 34 THEN cp.Wholesale END) AS Average_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 35 THEN cp.Wholesale END) AS Maximum_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 36 THEN cp.Wholesale END) AS Minimum_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 37 THEN cp.Wholesale END) AS Modal_Wholesale
FROM [dbo].[CropDimensions] AS cd
INNER JOIN [dbo].[2DCropPrices] AS cp ON cd.Id = cp.CropDimensionId
INNER JOIN [dbo].[StateDimensions] AS sd ON sd.Id = cp.StateDimensionId
WHERE cp.Date = @Date
    AND cp.StateDimensionId IN (@Id, 34, 35, 36, 37)
GROUP BY
    cd.image,
    cd.crop_name;
END
