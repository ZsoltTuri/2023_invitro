get_efield <- function(params){
  d <- data |> dplyr::filter(mso == params[["mso"]] & coil_distance == params[["coil_distance"]])  
  x <- d %>% filter(abs(bt_width - params[["bt_width"]]) == min(abs(bt_width - params[["bt_width"]])))
  y <- d %>% filter(abs(bt_depth - params[["bt_depth"]]) == min(abs(bt_depth - params[["bt_depth"]])))
  z <- d %>% filter(abs(bt_height - params[["bt_height"]]) == min(abs(bt_height - params[["bt_height"]])))
  results <- data.frame(x)
  results <- rbind(results, data.frame(y))
  results <- rbind(results, data.frame(z))
  results <- results  %>% dplyr::mutate(across(c('bt_width', 'bt_depth', 'bt_height', starts_with("EF_")), round, 4))
  return(results)
}