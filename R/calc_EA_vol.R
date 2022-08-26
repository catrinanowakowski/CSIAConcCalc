#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param smp_mass PARAM_DESCRIPTION
#' @param cut_vol PARAM_DESCRIPTION
#' @param massinmachine PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname calc_EA_vol
#' @export 
calc_EA_vol <- function(smp_mass, cut_vol, massinmachine){
  # smp_mass
  # cut_vol
  # massinmachine

  rho_smp_tfaaDCM <- smp_mass/1000 #1000ul of tffa and dcm
  inj_vols <- c(1,1.5,2,2.5,3,3.5,4)
  EA_vols <- rep(NA, length(inj_vols))

  for(i in 1:length(inj_vols)){
    EA_vols[i] <- cut_vol*rho_smp_tfaaDCM*inj_vols[i]/massinmachine

  }

  df <- data.frame(inj_vols_ul = inj_vols,
                   EA_vols_ul = round(EA_vols, digits = 1),
                   cut_ul = cut_vol,
                   massinmachine_mg = massinmachine,
                   smp_mass_mg = smp_mass)
  return(df)
}
