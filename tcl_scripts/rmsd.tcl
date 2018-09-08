#mol new ../protein.psf
#mol addfile crossover_prot.dcd waitfor all
set file [open "rmsd.txt" a]
set n [expr {int([molinfo top get numframes])}]
set sel [atomselect 0 "alpha and resid 8 to 220 276 to 463"]
set sel1 [atomselect top "alpha and resid 8 to 220 276 to 463"]
for {set i 0 } { $i <= $n } { incr i } {
    $sel1 frame $i
    $sel1 update
    set M [measure fit $sel1 $sel]
    $sel1 move $M
    set rmsd [measure rmsd $sel $sel1]
    puts $file $rmsd
    unset M
    unset rmsd
}
close $file
