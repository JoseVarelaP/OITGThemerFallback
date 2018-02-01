# OITGThemerFallback
Welcome to OITGThemerFallback.
The purpose of this Framework is to provide a better experience in porting old 3.9 themes to OpenITG. It is definetly recommended that you don't change anything on this code, but to add it on your own theme's metrics as a Fallback in [Global] and to modify it with your theme's metrics, otherwise, the changes won't apply that much to another theme that will use the same Framework; and even worse, it could mess up a lot.

## How to add it on your theme for porting
Simply put this command on your theme's metrics.ini file.
OpenITG will take care of the rest and start to run the commands along side your metrics.
If any command that you have collides with the ones from OITGThemerFallback, the one from your metrics will always be loaded instead.
```Python
[Global]
FallbackTheme=OITGThemerFallback
```

If you really need to modify this file a lot for your own theme, then please package it on your theme but with a different Fallback name, to avoid confusion and breaking if you're planning to re-obtaining the regular OITGThemerFallback.
