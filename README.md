## About

It is the code for my thesis
```
@thesis{
  author =       {Leidi Zhao},
  title =        {The iOS control application of WMR},
  year =         {2015},
  address =      {Shanghai, China},
  month =        {June},
  organization = {MPIG},
}
```
Controlling Carmela and Transmitting Video with iPad.

## Communication
use CocoaAsyncSocket,it's a Asynchronous socket networking library for Mac and iOS .
About this library.please see [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket).
the upper computer is TCP client.
the modified router (tp-link703N) is  TCP Server.
the upper computer communicates with slave computer through the modified router.


##video transmission
use MJPG-streamer, which is installed in the modified router.the video address is http://192.168.1.1:8080/?action=stream . But in the iOS6 or later, the UIwebview can not see the dynamic video by  visiting this address directly.To solve this problem, this address is written in a html. Through the html , the UIwebview can show real-time video.


## universality

you can change the command, host and port in the setting UI.



##


</br>**For more information, please contact  sunzuolei@gmail.com or zhaoleidi92@163.com**

