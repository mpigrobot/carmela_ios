## About

It is the code for my thesis
```
@CONFERENCE{
  author =       {Leidi Zhao},
  title =        {The iOS control application of WMR},
  year =         {2015},
  address =      {Shanghai, China},
  month =        {June},
  organization = {MPIG},
}
```
Control Carmela, the MPIG robot, with iPhone or iPad.

## Communication
use CocoaAsyncSocket,it's a Asynchronous socket networking library for Mac and iOS .
About this library.please see [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket).
the upper computer is TCP client.
the slave computer and the modified router (tp-link703N) is  TCP Server.


##video transmission
use MJPG-streamer, which is installed in the modified router.the video address is http://192.168.1.1:8080/?action=stream . But in the iOS6 or later, the UIwebview can not see the dynamic video by  visiting this address directly.To solve this problem, this address is written in a html. Through the html , the UIwebview can see  real-time video.


## universality

you can change the command, host and port in the setting UI.



##


</br>**For more information, please contact zhaoleidi92@163.com**

