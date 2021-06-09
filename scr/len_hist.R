
DATA_DIR <- 'C:/Users/danie/Documents/GitHub/hse21_-H3K27me3_G4_seq_Li_KPDS_human/data/'
NAME <- 'G4'
#NAME <- 'H3K27me3_HeLa-S3_intersect_with_G4'
#NAME <- 'H3K4me3_A549.ENCFF573MUH.hg19'
#NAME <- 'H3K4me3_A549.ENCFF573MUH.hg38'
#NAME <- 'H3K4me3_A549.ENCFF832EOL.hg19'
#NAME <- 'H3K4me3_A549.ENCFF832EOL.hg38'
OUT_DIR <- 'C:/Users/danie/Documents/hell/Results'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
