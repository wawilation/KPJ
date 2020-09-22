CREATE OR REPLACE FUNCTION fn_kpj_data_load() RETURNS VOID AS $$
BEGIN

PERFORM staging_mdmhits2_klgsh.fn_staging_mdmhits2_klgsh_load();
PERFORM staging_mdmhits2_kslg.fn_staging_mdmhits2_kslg_load();
PERFORM staging_medcubeskpj.fn_staging_medcubeskpj_load();
PERFORM staging_medcubeskpj_selangor.fn_staging_medcubeskpj_selangor_load();

END;
$$ LANGUAGE plpgsql;
