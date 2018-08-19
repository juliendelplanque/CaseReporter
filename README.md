# Case Reporter
A tool allowing to report issues found in Pharo projects directly from the image.
The goal is to provide a generic tool able to interface with Manuscript, Github, and potentially any other bugtracker.

# Install
```
Metacello new
    repository: 'github://JulienDelplanque/CaseReporter/src';
    baseline: 'CaseReporter';
    load
```

# Thanks
- A simple kernel of client to Manuscript was imported from [smalltalkhub](http://www.smalltalkhub.com/#!/~TorstenBergmann/FogBugz) and got a lot of enhancements in order to allow to report issues on this bugtracker.
