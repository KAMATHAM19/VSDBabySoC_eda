puts "RM-Info: Running script [info script]\n"

# -----------------------------------------------------------------------------
# Design and PDK setup
# -----------------------------------------------------------------------------
#
set DESIGN_NAME                   "rvmyth"  ;# Name of the top-level design
set PDK_PATH                      "/data/pdk/pdk32nm/SAED32_EDK/"  ;# Path to SAED32 PDK

##########################################################################################
# Hierarchical Flow Design Variables
##########################################################################################
#
set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################
# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

# Additional search path to be added to the default search path
set ADDITIONAL_SEARCH_PATH         "$PDK_PATH $PDK_PATH/tech/milkyway $PDK_PATH/tech/star_rcxt"

# Target technology logical libraries (using SAED32 HVT standard cell library)
set TARGET_LIBRARY_FILES           "$PDK_PATH/lib/stdcell_rvt/db_ccs/saed32rvt_tt0p78vn40c.db"

# No additional link libraries used in this setup
set ADDITIONAL_LINK_LIB_FILES      ""



# Optional min/max pair libraries (leave empty for single corner)
set MIN_LIBRARY_FILES              ""

# Milkyway reference libraries (for IC Compiler)
set MW_REFERENCE_LIB_DIRS          ""
set MW_REFERENCE_CONTROL_FILE      ""

# Milkyway technology file and parasitic modeling files
set TECH_FILE                      "$PDK_PATH/tech/milkyway/saed32nm_1p9m_mw.tf"
set MAP_FILE                       "saed32nm_tf_itf_tluplus.map"
set TLUPLUS_MAX_FILE               "saed32nm_1p9m_Cmax.tluplus"
set TLUPLUS_MIN_FILE               "saed32nm_1p9m_Cmin.tluplus"

# Routing layer constraints
set MIN_ROUTING_LAYER              "M1"
set MAX_ROUTING_LAYER              "M5"

# Optional don't-use lists (empty by default)
set LIBRARY_DONT_USE_FILE          ""
set LIBRARY_DONT_USE_PRE_COMPILE_LIST ""
set LIBRARY_DONT_USE_PRE_INCR_COMPILE_LIST ""

##########################################################################################
# Multivoltage Common Variables (not used for this design)
##########################################################################################

set PD1                            ""           
set VA1_COORDINATES                {}           
set MW_POWER_NET1                  "VDD1"

set PD2                            ""           
set VA2_COORDINATES                {}           
set MW_POWER_NET2                  "VDD2"

set PD3                            ""           
set VA3_COORDINATES                {}           
set MW_POWER_NET3                  "VDD3"

set PD4                            ""           
set VA4_COORDINATES                {}           
set MW_POWER_NET4                  "VDD4"

##########################################################################################
# Done
##########################################################################################
puts "RM-Info: Completed script [info script]\n"

