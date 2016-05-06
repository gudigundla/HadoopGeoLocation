echo "***********************************************************"
echo "Deleting /input, /output & some temporary directories on HDFS"
echo "***********************************************************"

hadoop fs -rmr /input
hadoop fs -rmr /output
hadoop fs -rmr /user/hadoop/*

echo "*********************************"
echo "Creating /input directory on HDFS"
echo "*********************************"

hadoop fs -mkdir /input

echo "**************************************************"
echo "Copying the geolocation.input file onto the HDFS"
echo "**************************************************"

hadoop fs -put ~/geolocation.input /input

echo "**********************************************"
echo "Executing the Hadoop GeoLocation MapReduce Job"
echo "**********************************************"

hadoop jar ~/HadoopGeoLocation.jar com.hadoop.examples.geolocation.GeoLocationJob /input /output

echo "*******************************************************************"
echo "Copying the output of the Hadoop job from HDFS to current directory"
echo "*******************************************************************"

rm -r output
hadoop fs -get /output

echo "*******************************************************************"
echo "run command:: ls output, to check the ouput of the Hadoop Job"
echo "run command:: cat output/part-r-00000 to check the grouped articles"
echo "*******************************************************************"

echo "#############################"
echo "Thank You, Have a nice day :)"
echo "#############################"
