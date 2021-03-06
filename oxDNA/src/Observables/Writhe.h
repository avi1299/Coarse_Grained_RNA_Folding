/*
 * Writhe.h
 *
 *  Created on: 16 Sep, 2015
 *      Author: Ferdinando Randisi
 */

#ifndef WRITHE_H_
#define WRITHE_H_

#include <iostream>
#include "BaseObservable.h"
/**
 * @brief Outputs the writhe of a strand, or the writhes of all the subdomains of a chain of the form [L,L+d], for all possible values of L and some d. It has been tested for the TEP model, but should in principle work
 for DNA as well.
 *
 * To use this observable, use type = writhe.
 *
 * This observable takes four optional arguments
 * @verbatim
[first_particle_index = <int> (defaults to 0. index of the first particle on which to compute the angle with the next particle.)]
[last_particle_index = <int> (defaults to the index of the first-but last bead in the same strand as the first particle. Therefore, if I have a strand of N beads, the last one will be the one with index N-2. This is because the last bead is atypical in the TEP model (e.g. it's aligned with the vector before it rather than the one in front of it.). index of the last particle of the chain on which to compute the angle.)]
[subdomain_size = <int> (if locate_plectonemes is false, defaults to the entire subchain, therefore computing the total writhe,otherwise it defaults to 35. If smaller, the writhe will be computed only on the beads between i and i+subdomain_size, for every i between first_particle_index and last_particle_index (wrapping around if go_round is true, or not computing it if the end of the chain is reached otherwise.)]
[go_around = <bool> (whether to assume periodic boundary conditions when building subdomains - see above. Defaults to true if the last particle is right before the first and if subdomain_size is not the entire subchain, and to false otherwise.)]
[locate_plectonemes = <bool> (if this is true, the writhe will be used to locate plectonemes with the algorithm from Vologodskii et al. "Conformational and THermodynamic Properties of Supercoiled DNA (1992)" and the indices on beads at the center of a plectoneme loop will be printed. Defaults to false.)]
[writhe_threshold = <double> (if the writhe exceeds this, then we mark a plectoneme. Only used if locate_plectonemes is true. Defaults to 0.28, since this is the value that works best with a subdomain_size of 35, which is the default one.)]
[print_space_position = <bool> (defaults to false. Whether to print the position of the plectoneme tip segment in 3d space as well as its index. Only used if locate_plectonemes = true.)]
[print_size = <bool> (defaults to false. Whether to print the plectoneme size compute with Ferdinando-Lorenzo's algorithm. Only used if locate_plectonemes = true.)]
[print_left_right = <bool> (defaults to false. Does everything like with the print_size option, but instead of printing the sizes it prints the indices of the first and last bead/base-pair of the plectoneme. Can't be used together with print_size. Only used if locate_plectonemes = true.)]
[contact_threshold = <number> (defaults to 5. Segments closer than this will be considered to be touching accourding to the plectoneme size algorithm.)]
[size_outer_threshold = <int> (defaults to 30. Outer threshold parameter, which substantially is the maximum separation in indices between two points of contact of a plectoneme loop, for the plectoneme size algorithm.)]
[minimum_plectoneme_size = <int> (defaults to 1. Plectonemes shorter than this wont' be reported.)]
[bending_angle_number_segments = <int> (defaults to 0. When non-zero, the angle between that many segments surrounding the plectoneme tip will be averaged and printed on file.)]
 @endverbatim
 */

template<typename number>
class Writhe : public BaseObservable<number> {
	private:
		// arguments
		int _first_particle_index;
		int _last_particle_index;
		int _subdomain_size;
		int _N;
		bool _particles_are_bases;

		bool _go_around;
		bool _use_default_go_around;
		bool _locate_plectonemes;
		bool _print_space_pos;
		bool _print_size;
		bool _print_left_right;
		
		number _contact_threshold;
		int _size_outer_threshold;
		int _minimum_plectoneme_size;
		int _bending_angle_number_segments;

		number _writhe_threshold;

		number ** _writhe_integrand_values;

		inline number _writheIntegrand(LR_vector<number> t,LR_vector<number> tp,LR_vector<number> r,LR_vector<number> rp);
	public:
		Writhe();
		virtual ~Writhe();

		virtual void init(ConfigInfo<number> &config_info);
		virtual void get_settings(input_file &my_inp, input_file &sim_inp);
		//virtual std::string get_output_stringOLD(llint curr_step);


		std::string get_output_string(llint curr_step);
};

template<typename number>
number Writhe<number>::_writheIntegrand(LR_vector<number> t,LR_vector<number> tp,LR_vector<number> r,LR_vector<number> rp){
	// (1/2pi) * t x t' . ( r - r')/ | r - r'|**3
	// The formula for writhe usually reports a prefactor of 1/4pi, but that's when both integration variables are left free. Since the double integral is symmetrical, we run the second integer with values greater than the first, hence the factor of 2 in the formula above.
	number rm = ( r - rp ).module();
	return ((t.cross(tp))*( r - rp ))/(2*M_PI*rm*rm*rm);
}

#endif /* WRITHE_H_ */
