#herewe  put all:final_output (oid)


spain_listings shanghai_listings: download_data.r
		R --vanilla <download_data.R
	
	
		
data_transformation.r: shanghai_listings spain_listings
		R --vanilla< data_transformation.r

