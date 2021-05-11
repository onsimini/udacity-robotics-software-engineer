#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>
using namespace std;

ros::ServiceClient client;

void drive_robot(float lin_x, float ang_z){
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;
    if (!client.call(srv)){
        ROS_ERROR("Failed to call service client");
    }
}

void process_image_callback(const sensor_msgs::Image img){
    const int white_value = 255;
    int pixel_cnt = 0;
    int obj_center = 0;
    int obj_cnt = 0;

    // Image Analyse.
    // obj_center: add all pixel position, the average on obj_cnt will be the middle
    // obj_cnt: count the number of found pixels
    while(pixel_cnt < img.data.size()){
        if((img.data[pixel_cnt]   == white_value) &&
           (img.data[pixel_cnt+1] == white_value) &&
           (img.data[pixel_cnt+2] == white_value))
        {
            obj_center += ((pixel_cnt%(img.width*3))/3);
            obj_cnt++;
        }
        pixel_cnt = pixel_cnt+3;
    }

    // Process the average if at least one pixel is found.
    // The object is on the right if the position is in the 1/3 of the image,
    // The object is on the left if the position is in the 3/3 of the image,
    // Else it is on the middle.
    if(obj_cnt){ //Object found
        obj_center = obj_center/obj_cnt; //Average
        if(obj_center < img.width/3){ 
            drive_robot(0.1, 0.5); //Move left
        }else if(obj_center > (img.width*2/3)){
            drive_robot(0.1, -0.5); //Move right
        }else{
            drive_robot(0.1, 0); //Move forware
        }
    }else{ //Object not found.
        drive_robot(0, 0); //Do not move
    }
}

int main(int argc, char** argv){
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);
    ros::spin();
    return 0;
}
