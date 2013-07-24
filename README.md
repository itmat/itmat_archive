## ITMAT Proteomics Data Archive

A simple Rails application that services to store the metadata from older proteomics experiments. Data are redundantly stored on bare hard drives.

### Dependencies

The application depends on PostgreSQL > 8.3

And Rails of course

### INSTALL

The usual way you install Rails and Rails applications.

### Full Text Search

Full text search is accomplished via the <tt>pg_search</tt> gem. More documentation about <tt>pg_search</tt> can be found at http://https://github.com/Casecommons/pg_search

See the <tt>Experiment</tt> model for what columns are searched.

### Underlying Annotation Data

The underlying records are all on the backup disks themselves. For each project directory there is a <tt>README.json</tt> file that contains all of the metadata. For your convenience, the data are also in the AWS S3 bucket <tt>s3://itmat-backups/itmat_proteomics_archive/json</tt>

### Archive Data

The data on the disks are (for historical reasons) compressed using the 7zip tool into 2GB chunks. The linux and OS X CLI application/package is called `p7zip` and the actual executables is called `7z`.

```bash
$ brew install p7zip
$ 7z -h

7-Zip [64] 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18
p7zip Version 9.20 (locale=utf8,Utf16=on,HugeFiles=on,4 CPUs)

Usage: 7z <command> [<switches>...] <archive_name> [<file_names>...]
       [<@listfiles...>]

<Commands>
  a: Add files to archive
  b: Benchmark
  d: Delete files from archive
  e: Extract files from archive (without using directory names)
  l: List contents of archive
  t: Test integrity of archive
  u: Update files to archive
  x: eXtract files with full paths
<Switches>
  -ai[r[-|0]]{@listfile|!wildcard}: Include archives
  -ax[r[-|0]]{@listfile|!wildcard}: eXclude archives
  -bd: Disable percentage indicator
  -i[r[-|0]]{@listfile|!wildcard}: Include filenames
  -m{Parameters}: set compression Method
  -o{Directory}: set Output directory
  -p{Password}: set Password
  -r[-|0]: Recurse subdirectories
  -scs{UTF-8 | WIN | DOS}: set charset for list files
  -sfx[{name}]: Create SFX archive
  -si[{name}]: read data from stdin
  -slt: show technical information for l (List) command
  -so: write data to stdout
  -ssc[-]: set sensitive case mode
  -t{Type}: Set type of archive
  -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]: Update options
  -v{Size}[b|k|m|g]: Create volumes
  -w[{path}]: assign Work directory. Empty path means a temporary directory
  -x[r[-|0]]]{@listfile|!wildcard}: eXclude filenames
  -y: assume Yes on all queries

```



### When This Site Fails You

There is another set of files in a 2-disk RAID0 array (3440_ARCHIVE_007). It contains:

* Mascot search results from 2008/01/02 to  2008/12/29
* A set of original qInteract version 1 archived results directories. Each is a TAR GZ file and has an associated manifest of the contained files in the TGZ.
* 329 orphaned files from the original ITMAT LIMS due to the LIMS project being deleted at some point. 

The manifest files for all of the above are also located on S3 at <tt>s3://itmat-backups/itmat_proteomics_archive/qinteract_manifests/</tt>

