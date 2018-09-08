set image 32
mol new ../protg.psf
mol addfile ${image}_raw.coor
mol new ../inoc_glucose.psf
mol addfile ../31_init.coor
#
# one by one align all of the atoms atop their new 
# coordinates from protg
for {set i 1 } { $i <= 485 } { incr i } {
    set prot [atomselect 0 "alpha and resid $i"]
    set inoc [atomselect 1 "alpha and resid $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset pos
}

set all [atomselect 1 all]
$all writepdb ${image}_alpha.pdb
$all delete
exit
