read_csv("data/Huang_2015/raw/GHS30_IntVarClim_Waratah-PxTxCxW_Carbohydrates_2011_L1.csv") -> carbo

read_csv("data/Huang_2015/raw/GHS30_IntVarClim_Waratah-PxTxCxW_GasExchangeACi_20110705-20110706_L1.csv") %>%
  select(-"VpdL (kPa)", -"Tleaf (deg C)", -"TBlk (deg C)", -"CO2S (umol mol-1)", -"CiCa (ratio)") %>%
  group_by(Species, Population, Temp, CO2, Genotype, Potnum) %>%
  top_n(1, `CO2R (umol mol-1)`) %>%
  rename(A_max_umol_per_m2_s1 = `Photo (umol m-2 s-1)`, Cond_at_A_max_mol_per_m2_s1 = `Cond (mol m-2 s-1)`, 
         Ci_at_A_max_ppm = `Ci (umol mol-1)`, Trans_at_A_max_mmol_per_m2_s1 = `Trmmol (mmol m-2 s-1)`) %>%
  select(-`CO2R (umol mol-1)`,-A_max_umol_per_m2_s1) -> A_max_values

read_csv("data/Huang_2015/raw/GHS30_IntVarClim_Waratah-PxTxCxW_GasExchangeAQ_20110706-20110708_L1.csv") %>%
  select(-`Area (cm2)`, -StmRat, -Tair, -Tleaf, -TBlk, -CO2R, -CO2S, -H2OR, -H2OS, -RH_R, -RH_S, -Flow, -PARi, -`VpdL (kPa)`, -Potnum_merged) %>%
  group_by(Species, Population, Temp, CO2, Genotype, Potnum) %>%
  top_n(1, `Photo (umol m-2 s-1)`) %>%
  rename(A_sat_umol_per_m2_s1 = `Photo (umol m-2 s-1)`, Cond_at_A_sat_mol_per_m2_s1 = `Cond (mol m-2 s-1)`, 
         Ci_at_A_sat_ppm = `Ci (umol mol-1)`, Trans_at_A_sat_mmol_per_m2_s1 = `Trmmol (mmol m-2 s-1)`) %>%
  select(-A_sat_umol_per_m2_s1, -Cond_at_A_sat_mol_per_m2_s1)-> A_sat_values

read_csv("data/Huang_2015/raw/GHS30_IntVarClim_Waratah-PxTxCxW_ACiParameters_20110705-20110706_L1.csv") %>%
  rename(A_max_umol_per_m2_s1 = Amax, A_sat_umol_per_m2_s1 = Asat, Cond_at_A_sat_mol_per_m2_s1 = gs) %>%
  mutate(Temp = as.double(Temp),
         Temp = gsub("30","Elv","Amb")) %>%
  select(-Treatment) -> Aci_parameters
      
read_csv("data/Huang_2015/raw/GHS30_IntVarClim_Waratah-PxTxCxW_Harvest_2011_L1.csv") %>%
  full_join(carbo,by=c("Species", "Population", "Temp", "CO2", "Potnum")) %>%
  full_join(A_max_values, by=c("Species", "Population", "Temp", "CO2", "Potnum")) %>%
  full_join(A_sat_values, by=c("Species", "Population", "Temp", "CO2", "Potnum", "Genotype")) %>%
  bind_rows(Aci_parameters) %>%
  mutate(species_name = "Telopea speciosissima",
         site_name = "University of Western Sydney",
         context = paste("Seeds_from_",Population,"_population_grown_at_",Temp,"_temp_and_",CO2,"_ppm_CO2",sep="")) %>% 
  write_csv("data/Huang_2015/data.csv") -> for_context

for_context %>%
  select(context, Population, Temp, CO2) %>%
  group_by(context) %>%
  mutate_at(vars("Population", "Temp", "CO2"),funs(replace(.,duplicated(.),NA))) %>%
  subset(!is.na(Population)) %>%
  mutate(type = "treatment",
         description = "seeds from coastal population grown at elevated 
         temperature (30/20 deg C) and high CO2 (640 ppm)") -> context_table
  
##In the spreadsheet with ACi curves, pot 68 is marked as being from population 'BWK219T2', while in the spreadsheet with AQ curve data,
pot 68 us marked as being from population 'BWK214T2'. Which is correct. (This inconsistency showed up as I was merging files by Pot number in R)