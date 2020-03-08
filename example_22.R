# From https://github.com/richelbilderbeek/pirouette_article/issues/57
#
# Write script that shows the true and twin error for Yule
# tree and Yule tree prior
#
# The only difference with
# https://github.com/richelbilderbeek/pirouette_example_3
# is that the twin tree must also be Yule (in the other
# example, the twin tree is BD)
#
suppressMessages(library(pirouette))

# Constants
is_testing <- is_on_ci()
example_no <- 22
rng_seed <- 314
folder_name <- file.path(paste0("example_", example_no, "_", rng_seed))

# Create phylogeny
set.seed(rng_seed)
phylogeny <- create_yule_tree(n_taxa = 6, crown_age = 10)

# Setup pirouette
pir_params <- create_std_pir_params(folder_name = folder_name)
pir_params$twinning_params$sim_twin_tree_fun = create_sim_yule_twin_tree_fun()
if (is_testing) {
  pir_params <- shorten_pir_params(pir_params)
}

# Run pirouette
pir_out <- pir_run(
  phylogeny,
  pir_params = pir_params
)
pir_save(
  phylogeny = phylogeny,
  pir_params = pir_params,
  pir_out = pir_out,
  folder_name = folder_name
)

