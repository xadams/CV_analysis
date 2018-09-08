#mol new protein.psf
#mol addfile crossover_prot.dcd waitfor all
set start 0
set n [expr {int([molinfo top get numframes])}]
set n2 [expr {int([molinfo top get numframes])}]
set file [open "double_loop.1.log" w]
#cv molid 0
#cv configfile /home/xadams/bin/orientation_new.in
#mol top 1
set sel [atomselect top "alpha and resid 8 to 220 276 to 463"]
#set sel [atomselect 0 "all"]
set sel1 [atomselect top "alpha and resid 8 to 220 276 to 463"]
for { set i $start } { $i < $n } { incr i } {
#    cv frame $i
#    cv update
#    set angles [cv printframe]
#    set angle [lindex $angles 2]
    $sel frame $i
    $sel update
    set k [expr {int($i+1)}]
    for { set j $k } { $j < $n2 } { incr j } {
        $sel1 frame $j
        $sel1 update
        set M [measure fit $sel1 $sel]
        $sel1 move $M
        set rmsd [measure rmsd $sel $sel1]
        puts $file "$i $j $rmsd"
        unset M
        unset rmsd
    }
#unset angle
#unset angles
}
close $file
exit
