#herewe  put all:final_output (oid)
all: sink(file = "gen/output/lm_output2")

spain_listings shanghai_listings: download_data.r
		R --vanilla < download_data.R
	
	
		
data_transformation.r: shanghai_listings spain_listings
		R --vanilla < data_transformation.r


sink(file = "gen/output/lm_output2"): analysis.R
		R --vanilla < analysis.R