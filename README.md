# `Waypoint controller for path tracking`

Waypoint controller developed for path tracking of an Indy Lights IL-15 race car using the Novatel GNSS receiver for localization.

The attached simulink file consists of the path tracking controller, which was based on the logic of Stanley controller. Two types of errors, viz. crosstrack error and yaw error were regulated to zero. The image below would help you understand the crosstrack and yaw error more clearly.

This controller was tested in simulation using multiple vehicle models that acted as a simulated vehicle. The current code consists of a 3 DOF linear bicycle model as the plant. The simulator was used to test out any path that we wanted to track in real life using the IL-15 vehicle parameters. Ensuring the vehicle states and the errors were within acceptable limits we would further move towards testing it on the actual vehicle.

The controller was tested on the actual Indy Lights vehicle and the demanded steering angle was given to the drive by wire system through Raptor.

## Dependency

The controller was built in MATLAB and you would need the following add-ons along with MATLAB R2020a to run the simulation successfully

* Vehicle dynamics blockset


## Running the simulation

We have three files that are used for successfully running the simulation
* parameters.m
  This file is used as an initialization file that contains all the parameters required for the waypoint controller and the bicycle model

* reference_path.mat
  It consists of reference points for the controller to track. The mat file consists of three variables X_waypoints, Y_waypoints and Yaw_waypoint essentially the reference X and Y co-ordinates and reference yaw.

* controller_with_3DOF_model.slx
  This is the Simulink file, which contains the waypoint controller along with the 3DOF bicycle model

To run the simulation, 
* Run the first section of the parameters.m file. This will load up all the parameter variables and also the reference path that the controller will track
* Open the Simulink file and run it. This will run the controller, tracking the path given in the reference_path.mat.


## Contributors
* Abhishek Rajendra Bhagwat
* Manikanda Balaji Venkatesan
