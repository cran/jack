test_that("Julia", {
  skip_if_not(JuliaConnectoR::juliaSetupOk(), "Julia setup is not OK")
  julia <- Jack_julia()
  # numerical ####
  x <- c("1/2", "2/3", "5")
  xq <- gmp::as.bigq(x)
  lambda <- c(2, 1, 1)
  # jack
  alpha <- "2/3"
  alphaq <- gmp::as.bigq(alpha)
  expect_equal(
    julia$Jack(x, lambda, alpha), Jack(xq, lambda, alphaq)
  )
  # zonal
  expect_equal(
    julia$Zonal(x, lambda), Zonal(xq, lambda)
  )
  # zonalQ
  expect_equal(
    julia$ZonalQ(x, lambda), ZonalQ(xq, lambda)
  )
  # Schur
  expect_equal(
    julia$Schur(x, lambda), Schur(xq, lambda)
  )
  # polynomials ####
  n <- 3
  lambda <- c(3, 2)
  # jack
  alpha <- "2/3"
  alphaq <- gmp::as.bigq(alpha)
  mvpol_julia <- julia$JackPol(n, lambda, alpha, poly = "mvp")
  gmpol_julia <- julia$JackPol(n, lambda, alpha, poly = "qspray")
  gmpol_r     <- JackPol(n, lambda, alphaq)
  #expect_true(mvpEqual(mvpol_julia, gmpoly::gmpoly2mvp(gmpol_julia)))
  expect_true(gmpol_r == gmpol_julia)
  # zonal
  mvpol_julia <- julia$ZonalPol(n, lambda, poly = "mvp")
  gmpol_julia <- julia$ZonalPol(n, lambda, poly = "qspray")
  gmpol_r     <- ZonalPol(n, lambda)
  #expect_true(mvpEqual(mvpol_julia, gmpoly::gmpoly2mvp(gmpol_julia)))
  expect_true(gmpol_r == gmpol_julia)
  # zonalq
  mvpol_julia <- julia$ZonalQPol(n, lambda, poly = "mvp")
  gmpol_julia <- julia$ZonalQPol(n, lambda, poly = "qspray")
  gmpol_r     <- ZonalQPol(n, lambda)
  #expect_true(mvpEqual(mvpol_julia, gmpoly::gmpoly2mvp(gmpol_julia)))
  expect_true(gmpol_r == gmpol_julia)
  # schur
  mvpol_julia <- julia$SchurPol(n, lambda, poly = "mvp")
  gmpol_julia <- julia$SchurPol(n, lambda, poly = "qspray")
  gmpol_r     <- SchurPol(n, lambda)
  #expect_true(mvpEqual(mvpol_julia, gmpoly::gmpoly2mvp(gmpol_julia)))
  expect_true(gmpol_r == gmpol_julia)
  # as.function
  mvpol <- julia$JackPol(m = 2, lambda = c(3, 1), alpha = "2/5", poly = "mvp")
  gmpol <- julia$JackPol(m = 2, lambda = c(3, 1), alpha = "2/5", poly = "qspray")
  f <- as.function(mvpol)
  y1 <- f("2/3", "7/5")
  y2 <- as.character(qspray::evalQspray(gmpol, c("2/3", "7/5")))
  expect_equal(y1, y2)
  #
  JuliaConnectoR::stopJulia()
})
