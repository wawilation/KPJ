#!/bin/bash
echo 'KPJ data load IN PROGRESS...'
echo 'KPJ data loading mdmhits2_klgsh...'
/usr/local/greenplum-db-6.7.1/bin/psql -p 5432 -U gpadmin -d kpj2 -t -c "SET search_path=staging_mdmhits2_klgsh; SELECT fn_staging_mdmhits2_klgsh_load();" 2>&1
if [ "$?" = "0" ]; then
	clear
	echo 'KPJ data loading of mdmhits2_klgsh DONE!'	
	echo 'KPJ data loading mdmhits2_kslg...'	
	/usr/local/greenplum-db-6.7.1/bin/psql -p 5432 -U gpadmin -d kpj2 -t -c "SET search_path=staging_mdmhits2_kslg; SELECT fn_staging_mdmhits2_kslg_load();" 2>&1

	if [ "$?" = "0" ]; then
		clear
		echo 'KPJ data loading of mdmhits2_klgsh DONE!'	
		echo 'KPJ data loading of mdmhits2_kslg DONE!'		
		echo 'KPJ data loading medcubeskpj...'		
		/usr/local/greenplum-db-6.7.1/bin/psql -p 5432 -U gpadmin -d kpj2 -t -c "SET search_path=staging_medcubeskpj; SELECT fn_staging_medcubeskpj_load();" 2>&1
	
			if [ "$?" = "0" ]; then
				clear
				echo 'KPJ data loading of mdmhits2_klgsh DONE!'	
				echo 'KPJ data loading of mdmhits2_kslg DONE!'		
				echo 'KPJ data loading of medcubeskpj DONE!'				
				echo 'KPJ data loading medcubeskpj_selangor...'				
				/usr/local/greenplum-db-6.7.1/bin/psql -p 5432 -U gpadmin -d kpj2 -t -c "SET search_path=staging_medcubeskpj_selangor; SELECT fn_staging_medcubeskpj_selangor_load();" 2>&1

				clear
				echo 'KPJ data loading of mdmhits2_klgsh DONE!'	
				echo 'KPJ data loading of mdmhits2_kslg DONE!'		
				echo 'KPJ data loading of medcubeskpj DONE!'				
				echo 'KPJ data loading of medcubeskpj_selangor DONE!'
				echo 'KPJ data loading COMPLETED!'					

			else	
				exit	
			fi
	else	
		exit	
	fi
else	
	exit	
fi

