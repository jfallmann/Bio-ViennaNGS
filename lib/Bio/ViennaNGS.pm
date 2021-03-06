# -*-CPerl-*-
# Last changed Time-stamp: <2015-06-01 11:48:19 mtw>

package Bio::ViennaNGS;

use version; our $VERSION = qv('0.15_03');

1;

=head1 NAME

Bio::ViennaNGS - A Perl distribution for Next-Generation Sequencing
(NGS) data analysis

=head1 DESCRIPTION

Bio::ViennaNGS is a distribution of Perl modules and utilities for
building efficient Next-Generation Sequencing (NGS) analysis
pipelines. It covers various aspects of NGS data analysis, including
(but not limited to) conversion of sequence annotation, evaluation of
mapped data, expression quantification and visualization.

The main Bio::ViennaNGS module is shipped with a complementary set of
(sub)modules:

=over

=item L<Bio::ViennaNGS::AnnoC>: A Moose interface for storage and
conversion of sequence annotation data.

=item L<Bio::ViennaNGS::Bam>: Routines for high-level manipulation of
BAM files.

=item L<Bio::ViennaNGS::BamStat>: A L<Moose> based class for
collecting mapping statistics.

=item L<Bio::ViennaNGS::BamStatSummary>: A L<Moose> interface for
processing L<Bio::ViennaNGS::BamStat> objects on a set of BAM files.

=item L<Bio::ViennaNGS::Bed>: A L<Moose> interface for manipulation of
genomic interval data in BED format.

=item L<Bio::ViennaNGS::Expression>: An object oriented interface for
read-count based gene expression analysis.

=item L<Bio::ViennaNGS::ExtFeature>: A L<Moose> wrapper for extended
BED6 entries.

=item L<Bio::ViennaNGS::Fasta>: Routines for accessing genomic
sequences implemented through a L<Moose> interface to
L<Bio::DB::Fasta>.

=item L<Bio::ViennaNGS::Feature>: A L<Moose> based BED6 wrapper.

=item L<Bio::ViennaNGS::FeatureChain>: Yet another L<Moose> class for
chaining gene annotation features.

=item L<Bio::ViennaNGS::FeatureLine>: An abstract L<Moose> class for
combining several L<Bio::ViennaNGS::FeatureChain> objects.

=item L<Bio::ViennaNGS::MinimalFeature>: A L<Moose> interface for
handling elementary gene annotation.

=item L<Bio::ViennaNGS::SpliceJunc>: A collection of routines for
alternative splicing analysis.

=item L<Bio::ViennaNGS::Tutorial>: A comprehensive tutorial of the
  L<Bio::ViennaNGS> core routines with real-world NGS data.

=item L<Bio::ViennaNGS::UCSC>: Routines for visualization of genomics
data with the UCSC genome browser.

=item L<Bio::ViennaNGS::Util>: A collection of wrapper routines for
commonly used third-party NGS utilities, code for normalization of
gene expression values based on read count data and a set of utility
functions.

=back

=head1 UTILITIES

L<Bio::ViennaNGS> comes with a collection of command line utilities
for accomplishing routine tasks often required in NGS data
processing. These utilities serve as reference implementation of the
routines implemented throughout the modules and can readily be used
for atomic tasks in NGS data processing:

=over

=item F<assembly_hub_constructor.pl>: The UCSC genome browser offers
the possibility to visualize any organism (including organisms that
are not included in the standard UCSC browser bundle) through hso
called 'Assembly Hubs'. This script constructs Assembly Hubs from
genomic sequence and annotation data.

=item F<bam_split.pl>: Split (paired-end and single-end) BAM alignment
files by strand and compute statistics. Optionally create BED output,
as well as normalized bedGraph and bigWig files for coverage
visualization in genome browsers (see dependencies on third-patry
tools below).

=item F<bam_to_bigWig.pl>: Produce bigWig coverage profiles from
(aligned) BAM files, explicitly considering strandedness. The most
natural use case of this tool is to create strand-aware coverage
profiles in bigWig format for genome browser visualization.

=item F<bam_uniq.pl>: Extract unique and multi mapping reads from BAM
alignment files and create a separate BAM file for both uniqe (.uniq.)
and multi (.mult.) mappers.

=item F<bed2bedGraph.pl>: Convert BED files to (strand specific)
bedGraph files, allowing additional annotation and automatic
generation of bedGraph files which can easily be converted to big-type
files for easy UCSC visualization.

=item F<extend_bed.pl>: Extend genomic features in BED files by a
certain number of nucleotides, either on both sides or specifically at
the 5' or 3' end, respectively.

=item F<gff2bed.pl>: Convert RefSeq GFF3 annotation files to BED12
format. Individual BED12 files are created for each feature type
(CDS/tRNA/rRNA/etc.). Tested with RefSeq bacterial GFF3 annotation.

=item F<kmer_analysis.pl>: Count k-mers of predefined length in FastQ
and Fasta files

=item F<MEME_XML_motif_extractor.pl>: Compute simple statistics from
MEME XML output and return a list of found motifs with the number of
sequences containing those motifs as well as nice ggplot graphs.

=item F<newUCSCdb.pl>: Create a new genome database to a locally
installed instance of the UCSC genome browser in order to add a novel
organism for visualization. Based on L<this Genomewiki
article|http://genomewiki.ucsc.edu/index.php/Building_a_new_genome_database>.

=item F<normalize_multicov.pl>: Compute normalized expression data in
TPM from (raw) read counts in bedtools multicov format. TPM reference:
Wagner et al, Theory Biosci. 131(4), pp 281-85 (2012)

=item F<sj_visualizer.pl>: Convert splice junctions from mapped
RNA-seq data in segemehl BED6 splice junction format to BED12 for easy
visualization in genome Browsers.

=item F<splice_site_summary.pl>: Identify and characterize splice
junctions from RNA-seq data by intersecting them with annotated splice
junctions.

=item F<trim_fastq.pl>: Trim sequence and quality string fields in a
Fastq file by user defined length.

=back

=head1 DEPENDENCIES

The L<Bio::ViennaNGS> modules and classes depend on a set of Perl
modules, some of which are part of the Perl core distribution:

=over

=item L<Bio::Perl> >= 1.00690001

=item L<Bio::DB::Sam> >= 1.37

=item L<Bio::DB::Fasta>

=item L<Bio::Tools::GFF>

=item L<File::Basename>

=item L<File::Share>

=item L<File::Temp>

=item L<Path::Class>

=item L<IPC::Cmd>

=item L<Carp>

=item L<Template>

=item L<Moose>

=item L<Moose::Util::TypeConstraints>

=item L<namespace::autoclean>

=item L<MooseX::Clone>

=item L<MooseX::InstanceTracking>

=item L<Tie::Hash::Indexed>

=back

In addition the following modules are required by the L<Bio::ViennaNGS> utilities:

=over

=item L<PerlIO::gzip>

=item L<Math::Round>

=item L<XML::Simple>

=item L<Statistics::R>

=back

L<Bio::ViennaNGS> uses third-party tools for computing intersections
of BED files: F<bedtools intersect> from the
L<BEDtools|http://bedtools.readthedocs.org/en/latest/content/tools/intersect.html>
suite is used to compute overlaps and F<bedtools sort> is used to sort
BED output files. Make sure that those third-party utilities are
available on your system, and that hey can be found and executed by
the Perl interpreter. We recommend installing the latest version of
L<BEDtools|https://github.com/arq5x/bedtools2> on your system.

=head1 SOURCE AVAILABILITY

Source code for this distribution is available from the L<ViennaNGS
Github repository|https://github.com/mtw/Bio-ViennaNGS>.

=head1 PAPERS

If the L<Bio::ViennaNGS> suite is useful for your work or if you use
any component of the distribution in a custom pipeline, please cite
the following publication:

B<"ViennaNGS - A toolbox for building efficient next-generation sequencing
analysis pipelines">

I<Michael T. Wolfinger, Joerg Fallmann, Florian Eggenhofer and Fabian Amman>

bioRxiv L<doi:10.1101/013011|http://dx.doi.org/10.1101/013011>.

=head1 NOTES

The L<Bio::ViennaNGS> suite is actively developed and tested on
different flavours of Linux and Mac OS X. We have taken care of
writing platform-independent code that should run out of the box on
most UNIX-based systems, however we do not have access to machines
running Microsoft Windows. As such, we have not tested and will not
test Windows compatibility.

=head1 SEE ALSO

=over

=item L<Bio::ViennaNGS::AnnoC>

=item L<Bio::ViennaNGS::Bam>

=item L<Bio::ViennaNGS::BamStat>

=item L<Bio::ViennaNGS::BamStatSummary>

=item L<Bio::ViennaNGS::Bed>

=item L<Bio::ViennaNGS::Expression>

=item L<Bio::ViennaNGS::ExtFeature>

=item L<Bio::ViennaNGS::Fasta>

=item L<Bio::ViennaNGS::Feature>

=item L<Bio::ViennaNGS::FeatureChain>

=item L<Bio::ViennaNGS::FeatureLine>

=item L<Bio::ViennaNGS::MinimalFeature>

=item L<Bio::ViennaNGS::SpliceJunc>

=item L<Bio::ViennaNGS::Tutorial>

=item L<Bio::ViennaNGS::UCSC>

=item L<Bio::ViennaNGS::Util>

=back

=head1 AUTHORS

=over

=item Michael T. Wolfinger E<lt>michael@wolfinger.euE<gt>

=item Joerg Fallmann E<lt>fall@tbi.univie.ac.atE<gt>

=item Florian Eggenhofer E<lt>florian.eggenhofer@tbi.univie.ac.atE<gt>

=item Fabian Amman E<lt>fabian@tbi.univie.ac.at<gt>

=back

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014-2015 Michael T. Wolfinger
E<lt>michael@wolfinger.euE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

This software is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut


