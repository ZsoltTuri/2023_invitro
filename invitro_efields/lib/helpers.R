get_efield <- function(params){
  d <- data |> dplyr::filter(mso == params$mso & coil_distance == params$coil_distance & bt_height == params$bt_height & liquid_height == params$liquid_height)  
  x <- d |> dplyr::filter(abs(bt_width - params$bt_width) == min(abs(bt_width - params$bt_width)))
  y <- d |> dplyr::filter(abs(bt_depth - params$bt_depth) == min(abs(bt_depth - params$bt_depth)))
  results <- data.frame(x)
  results <- rbind(results, data.frame(y))
  results <- results |> dplyr::mutate(across(c('bt_width', 'bt_depth', 'bt_height', starts_with("EF_")), \(x) round(x, 4)))
  return(results)
}

get_efield_mso_range <- function(params){
  mso_min <- min(params$mso)
  mso_max <- max(params$mso)
  d <- data |> dplyr::filter(mso >= mso_min & mso <= mso_max & coil_distance == params$coil_distance & bt_height == params$bt_height & liquid_height == params$liquid_height)  
  x <- d |>  dplyr::filter(abs(bt_width - params$bt_width) == min(abs(bt_width - params$bt_width)))
  y <- d |>  dplyr::filter(abs(bt_depth - params$bt_depth) == min(abs(bt_depth - params$bt_depth)))
  results <- data.frame(x)
  results <- rbind(results, data.frame(y))
  results <- results |> dplyr::mutate(across(c('bt_width', 'bt_depth', 'bt_height', starts_with("EF_")), \(x) round(x, 4)))
  return(results)
}