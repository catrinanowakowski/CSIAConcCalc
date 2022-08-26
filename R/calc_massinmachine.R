#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param smp_mass PARAM_DESCRIPTION
#' @param cut_vol PARAM_DESCRIPTION
#' @param EA_vol PARAM_DESCRIPTION
#' @param inj_vol PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname calc_massinmachine
#' @export 
calc_massinmachine <- function(smp_mass, cut_vol,EA_vol,inj_vol ){
  # smp_mass
  # cut_vol
  # EA_vol
  # inj_vol

  rho_smp_tfaaDCM <- smp_mass/1000 #1000ul of tffa and dcm

  massinmachine <- cut_vol*rho_smp_tfaaDCM*inj_vol/EA_vol
  return(massinmachine)
}
