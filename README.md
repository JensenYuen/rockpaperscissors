<div id="top">

  <!-- TABLE OF CONTENTS -->
  ## Table Of Contents
  <details>
    <summary>Table of Contents</summary>
    <ol>
      <li><a href="#acknowledgments">Acknowledgments</a></li>
      <li>
        <a href="#about-the-project">About The Project</a>
        <ul>
          <li><a href="#considerations">Considerations</a></li>
          <li><a href="#built-with">Built With</a></li>
        </ul>
      </li>
      <li>
        <a href="#getting-started">Getting Started</a>
        <ul>
          <li><a href="#installation">Installation</a></li>
        </ul>
      </li>
    </ol>
  </details>
  
</div>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

I would like to take the opportunity to thank the Mavericks Team for the chance to attempt this developer assignment. In addition to testing my current skills, I have picked up something new along the way; Unit testing. While I used it before and seen code snipets of it before, I have never written one myself. This opportunity has allowed me to understand better why TDD is important and how it can help a developer better focus on the task.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ABOUT THE PROJECT -->
## About The Project

The objective was to allow a user (player),
1. play against the computer 
2. Watch computer vs computer

Technical constraints were as follows,
1. The solution should be easily runnable from the command line.
2. Third-party or external libraries should only be used for test.

<p align="right">(<a href="#top">back to top</a>)</p>

### Considerations

In ruby OOP, we used classes to define the states and behaviour of our code. 
Additionally, to reduce clutter I adopted the [MVC](https://developer.mozilla.org/en-US/docs/Glossary/MVC) design pattern.
This would increase the files used but would make my code cleaner as well.
Extendability of the code was also a factor to consider, as increased complexity of the game would also affect the logics in some methods. Thus, certain methods were seperate to be independent of logic and could be easier updated if needed.

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With

* [Ruby](https://www.ruby-lang.org/en/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo
   ```sh
   gh repo clone JensenYuen/rockpaperscissors
   ```
2. Install Ruby gems 
   ```sh
   cd rockpaperscissors
   bundle install
   ```
3. To run the application
   ```sh
   ruby lib/interface.rb
   ```
4. To run the test
   ```sh
   rspec
   ```
<p align="right">(<a href="#top">back to top</a>)</p>

