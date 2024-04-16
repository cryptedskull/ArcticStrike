#include <iostream>
#include <csignal>

#include "network/tcp_socket.h"
#include "user_interface/display.h"

void signal_handler(int signal) {
    if (signal == SIGINT) {
        clear_screen();
        std::cout << "[!] Thanks for using atlasploit, goodbye!" << std::endl;
        exit(signal);
    }
} 

// Main function
int main() {
    signal(SIGINT, signal_handler);
    clear_screen();
    print_banner("resources/banner.txt");
    return 0;
}