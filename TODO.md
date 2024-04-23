## TODO
- [ ] Establish reusable commands + better handling
- [ ] Organize/document namespaces
- [ ] Add modular encryption for communications
- [ ] Setup standard communication method throughout protocols
- Exploitation
    - [ ] Use established exploits (for now use published ones)
    - [ ] Custom exploit file/folder (set with optparse)
    - [ ] Exploit customization (LHOST, RHOST, etc)
- Payload Development
    - [ ] Automatic payload generation
    - [ ] Integrate with established communication method
    - [ ] Modular options to include with payload
- Command and Control
    - [ ] Establish baseline communication "standard"
    - [ ] Integrate with multiple protocols/methods
- Utilities
    - [ ] Web server for easy file delivery (opt. to include only certain file(s)/folder)
    - [ ] TCP connector/receiver utility, not too dissimilar to netcat
    - [ ] Hashing utilities integration

## Planned Features / Ideas
- [ ] Windows/MacOS compatability
- [ ] Daemon for designated longterm C2 activity
- [ ] Work with existing exploits written in Ruby, Python, etc. Existing post-exploitation tool integration
- [ ] Purpose-built exploit compiler and development tools
- [ ] Multi-target handling and fleet actions/control
- [ ] Containerization of target-handling processes to ensure host security
- [ ] Partially automate workflow of payload generation and C2 configuration
- [ ] Tamper/reverse engineering detection on server-side