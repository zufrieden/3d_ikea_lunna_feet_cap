// Dimensions en mm

hauteur_bordure=40.69; // Hauteur du triangle fin
rayon_haut_bordure=7.08/2; // Rayon de courbure du haut du triangle fin

hauteur_base=11.46; // Hauteur de la base
largeur_base=15.04; // Largeur de la base

// Encoche
creux=6.2; // Epaisseur de l'encoche au point le plus étroit
largeur_base_pointe=8.36; //Epaisseur de l'encoche à la base

hauteur_encoche=36.55;
bordure_base_encoche=1; //Bordure à la base de l'encoche
position_hauteur_base_pointe=18.72;
base_creux_encoche=15.19;
hauteur_creux=position_hauteur_base_pointe - base_creux_encoche;
hauteur_base_pointe=1;
rayon_haut_encoche=4.43/2; // Rayon de courbure du haut de l'encoche

profondeur_bordure=5.13;
profondeur_encoche=35.16;
profondeur_base=39.9;


$fn=100; //resolution

module base(){
	translate([hauteur_base/2,0,0]){
		square([hauteur_base,largeur_base], center=true);
	}
}

module encoche(){

	module milieu(){
		polygon(points=[[hauteur_base,largeur_base/2-bordure_base_encoche],[base_creux_encoche,creux/2],[base_creux_encoche,-creux/2],[hauteur_base,-(largeur_base/2-bordure_base_encoche)]], paths=[[0,1,2,3]]);
		translate([hauteur_creux/2+base_creux_encoche,0]){square([hauteur_creux,creux], center=true);};
		hull(){
			translate([position_hauteur_base_pointe+hauteur_base_pointe/2,0]){square([hauteur_base_pointe,largeur_base_pointe], center=true);};
			translate([hauteur_encoche-rayon_haut_encoche,0]){circle(rayon_haut_encoche, center=true);};
		}
	}
	module haut(){

	}
	base();
	milieu();
	haut();
}

module bordure(){
	hull(){
		translate([hauteur_base/2,0]){base();};
		translate([hauteur_bordure-rayon_haut_bordure,0]){circle(rayon_haut_bordure, center=true);};
	}
}



color([255, 0, 0, 1]){
	linear_extrude(profondeur_base){
		base();
	}
}

color([0, 255, 0, 1]){
	linear_extrude(profondeur_encoche){
		encoche();
	}
}

color([255, 255, 0, 1]){
	linear_extrude(profondeur_bordure){
		bordure();
	}
}