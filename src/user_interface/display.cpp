#include <iostream>
#include <fstream>


void clear_screen() {
    std::cout << "\033[2J\033[1;1H"; // ANSI escape sequence to clear screen
    std::cout.flush();
}

void print_banner(std::string defined_banner) {
    std::ifstream banner_file(defined_banner);
    if (!banner_file.is_open()) {
        std::cout << "Error opening banner file";
    }

    std::string banner;
    std::string line;
    while (std::getline(banner_file, line))
        banner += line + "\n";
    std::cout << banner;

}
