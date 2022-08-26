#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param goal_peak PARAM_DESCRIPTION
#' @param test_mass PARAM_DESCRIPTION
#' @param actual_peak PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname calc_target_mass
#' @export 
calc_target_mass <- function(goal_peak, test_mass,actual_peak ){
  # goal_peak
  # test_mass
  # actual_peak

  target_mass <- goal_peak*test_mass/actual_peak
  return(target_mass)
}
