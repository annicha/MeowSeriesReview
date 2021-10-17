# MeowSeriesReview
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)

This is a simple demo app that let you express comments about TV series.

### To do
- [x] Design overall UI
- [x] Test API fetching via Postman
- [ ] Set up project with FireStore and Auth
- [ ] Work on TV list and detail view
- [ ] Work on Cat list
- [ ] Implement creating comment
- [ ] Implement listener and filter for all comments
- [ ] Update movie detail view with comment list
- [ ] Add app preview gif to this file :tada:

### API Used
- [REST COUNTRIES 🇵🇪](https://restcountries.com)
- [TMDB](https://www.themoviedb.org/)
- [The Cat API](https://thecatapi.com/)

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


### Early Design via Sketch
<img src="meowmovie.gif" alt="Screenshots" width="400px">



