# This file was generated, do not modify it. # hide
ST = norm(y .- y_med)^2
Sr_quase = norm(y - y_quase)^2
Sr_pred = norm(y - y_pred)^2
R2_quase = 1 - Sr_quase / ST
R2_pred = 1 - Sr_pred / ST
println("R2_quase = $R2_quase")
println("R2_pred = $R2_pred")