context("Make Scorecard")

test_that("scorecard generation works", {
  data(calibration_questions)
  data(mc_domains)
  data(mc_scenarios)
  data(mc_capabilities)
  data(mc_sme_top_domains)
  data(mc_threat_communities)

  tmpdir <- file.path(tempdir(), "collector")
  dir.create(tmpdir, showWarnings = TRUE)

  ques <- tidyrisk_question_set(domains = mc_domains,
                                calibration = calibration_questions,
                                scenarios = mc_scenarios,
                                capabilities = mc_capabilities,
                                expertise =  mc_sme_top_domains,
                                threat_communities = mc_threat_communities)

  make_scorecard("Natalie Wade", ques, tmpdir)
  file_location <- file.path(tmpdir, "natalie_wade_scorecard.pdf")
  expect_true(file.exists(file_location))
  unlink(tmpdir, recursive = TRUE)
})

test_that("Bingo function is deprecated", {
  data(calibration_questions)
  data(mc_domains)
  data(mc_scenarios)
  data(mc_capabilities)
  data(mc_sme_top_domains)
  data(mc_threat_communities)

  tmpdir <- file.path(tempdir(), "collector")
  dir.create(tmpdir, showWarnings = TRUE)

  ques <- tidyrisk_question_set(domains = mc_domains,
                                calibration = calibration_questions,
                                scenarios = mc_scenarios,
                                capabilities = mc_capabilities,
                                expertise =  mc_sme_top_domains,
                                threat_communities = mc_threat_communities)

  expect_warning(make_bingo("Natalie Wade", ques, tmpdir), "deprecate")

  unlink(tmpdir, recursive = TRUE)
})
