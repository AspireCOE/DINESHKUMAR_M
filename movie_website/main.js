// home page 
// logout
document.addEventListener("DOMContentLoaded", function () {
  // Get the user icon element
  var logoutIcon = document.getElementById("logoutIcon");

  // Add click event listener to the user icon
  logoutIcon.addEventListener("click", function () {
    // Show a confirmation dialog
    var confirmLogout = confirm("Are you sure you want to logout?");

    // If user confirms logout
    if (confirmLogout) {
      // Redirect to login.html
      window.location.href = "login.html";
    }
  });
});

// Define a function to fetch data from JSON file
function fetchData() {
  // Fetch data from JSON file
  return fetch("./data.json")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .catch((error) => {
      console.error("There was a problem with the fetch operation:", error);
    });
}
let movieData;
window.addEventListener("load", async () => {
  window.localStorage.setItem("movies", JSON.stringify(await fetchData()));
  movieData = JSON.parse(localStorage.getItem("movies"));

  // Construct HTML for carousel items
  let carouselInner = document.querySelector(".carousel-inner");
  for (const movieId in movieData.movies) {
    if (movieId === "m4") break;
    const movie = movieData.movies[movieId];
    const isActive = movieId === "m1" ? "active" : ""; // Set first movie as active
    const carouselItem = `
                <a href="/movie_page.html?id=${movieId}">
                  <div class="carousel-item ${isActive}">
                   <div class="movie"  style="
                   background-image: url('${movie.cover}');
                   ">
                   <div class="movie-details">
                      <h1 class="movie-title">${movie.name}</h1>
                      <p class="year">${movie.year}</p>
                      <p class="imdb">IMDB rating : ${movie.rating}</p>
                      <button class="watch-btn">
                        <i class="ri-play-fill"></i>Watch
                      </button>
                    </div>
                    </div>
                  </div>
                </a>
              `;
    carouselInner.innerHTML += carouselItem;
  }

  // Construct HTML for thriller movies
  const thrillerMoviesContainer = document.querySelector(".thriller-list");
  for (const movieId in movieData.movies) {
    const movie = movieData.movies[movieId];
    if (movie.genre.includes("thriller")) {
      const thrillerMovie = `
      <a href="/movie_page.html?id=${movieId}">
      <div class="thriller-movies">
      <img
      src="${movie.thumbnail}"
      alt=""
      />
      </div>
      </a>
    `;
      thrillerMoviesContainer.innerHTML += thrillerMovie;
    }
  }

  // Construct HTML for comedy movies
  const comedyMoviesContainer = document.querySelector(".comedy-list");
  for (const movieId in movieData.movies) {
    const cmovie = movieData.movies[movieId];
    if (cmovie.genre.includes("comedy")) {
      const comedyMovie = `
    <a href="/movie_page.html?id=${movieId}">
    <div class="comedy-movies">
    <img
    src="${cmovie.thumbnail}"
    alt=""
    />
    </div>
    </a>
  `;
      comedyMoviesContainer.innerHTML += comedyMovie;
    }
  }

  // Construct HTML for series movies
  const seriesMoviesContainer = document.querySelector(".series-list");
  for (const movieId in movieData.movies) {
    const series = movieData.movies[movieId];
    if (series.genre.includes("series")) {
      const series_1 = `
    <a href="/movie_page.html?id=${movieId}">
    <div class="series-movies">
    <img
    src="${series.thumbnail}"
    alt=""
    />
    </div>
    </a>
  `;
      seriesMoviesContainer.innerHTML += series_1;
    }
  }

  // Construct HTML for fav movies
  const favMoviesContainer = document.querySelector(".fav-list");
  for (const movieId in movieData.movies) {
    const fav_movie = movieData.movies[movieId];
    if (fav_movie.fav.includes("yes")) {
      const fav_content = `
    <a href="/movie_page.html?id=${movieId}">
    <div class="fav-movies">
    <img
    src="${fav_movie.thumbnail}"
    alt=""
    />
    </div>
    </a>
  `;
      favMoviesContainer.innerHTML += fav_content;
    }
  }

});



// Search input event listener
const searchInput = document.querySelector(".search-input");
const searchDropdown = document.querySelector(".search-dropdown");

searchInput.addEventListener("input", function (event) {
  const searchQuery = event.target.value.trim();
  renderSearchResults(searchQuery);
});

function renderSearchResults(searchQuery) {
  const searchDropdown = document.getElementById("searchDropdown");
  searchDropdown.innerHTML = ""; // Clear previous results

  if (searchQuery) {
    for (const movieId in movieData.movies) {
      const movie = movieData.movies[movieId];
      // Check if movie name or genre matches the search query
      if (
        movie.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        movie.genre.includes(searchQuery.toLowerCase())
      ) {
        const searchItem = document.createElement("div");
        searchItem.classList.add("search-item");
        searchItem.innerHTML = `
                    <a href="movie_page.html?id=${movieId}" class="search-result">
                        <img src="${movie.main_pic}" alt="${movie.name}" class="search-thumbnail">
                        <span>${movie.name}</span>
                    </a>
                `;
        searchDropdown.appendChild(searchItem);
      }
    }

    if (searchDropdown.children.length === 0) {
      const noResultItem = document.createElement("div");
      noResultItem.classList.add("search-item");
      noResultItem.textContent = "No results found";
      searchDropdown.appendChild(noResultItem);
    }

    searchDropdown.classList.add("show");
  } else {
    searchDropdown.classList.remove("show");
  }
}

// Close dropdown when clicking outside
document.addEventListener("click", function (event) {
  if (!event.target.matches(".search-input")) {
    searchDropdown.classList.remove("show");
  }
});
