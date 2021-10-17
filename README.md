# MeowSeriesReview
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)

![Screenshots](meowmovie.gif)

This is a simple demo app that let you express comments about TV series.

### API Used
[REST COUNTRIES 🇵🇪](https://restcountries.com)
[TMDB](https://www.themoviedb.org/)
[The Cat API](https://thecatapi.com/)

### Setup
1. After cloning this project, please head to your Firebase dashboard to setup a GoogleServices-info.plist file and drag it to the *resources* folder in this project.
2. Please sign up to get your own API Key from [TMDB](https://www.themoviedb.org/) and [The Cat API](https://thecatapi.com/). Store the keys in a struct or where appropriate.

```
// SecretKeys.swift
struct SecretKeys {
	static let movieAPIKey	= "your key"
	static let catAPIKey	= "your key"
}
```


