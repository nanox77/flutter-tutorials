# How to clone UI Disney Plus

Hello there!

In this post, we are going to show you how to clone the UI of Disney Plus.

The final design will be something like this:

![Source image](/images/original-min.png)

Firstly, run command to create a new project:

```
$ mkdir -p ~/Desktop/DisneyPlus
$ cd ~/Desktop/DisneyPlus
flutter create disney_plus
```

Or you can create it with VS Code or any other IDE.

Let's code it!

Now, we start with easy part: appbar and bottom navigation.

AppBar:

Generally, we use AppBar to show the title of the page. In this case, we will use an image because it is a logo of Disney Plus.

So, the [AppBar widget](https://api.flutter.dev/flutter/material/AppBar-class.html) will have an image provided by assets folder.

In Flutter, we need to provide the path of the image in `pubspec.yaml` file. So, we need to add the following line in `pubspec.yaml` file:

```
flutter:
  assets:
    - disney_plus_logo.png
```

And then, we need to restart all application because these images will be uploaded in build time.

Once we have the image, we can use it in our app.

```
  static const disneyLogo = 'assets/disney_plus_logo.png';
  static const kToolbarHeight = 56.0;

  AppBar disneyAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Image.asset(
          disneyLogo,
          fit: BoxFit.contain,
        ),
      ),
      toolbarHeight: kToolbarHeight,
    );
  }
```

And it will look like this:

![Source image](/images/disney-plus-1-min.png)

And now, let's do the [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html).

You notice that the bottom navigation has a very thin divider above it. So, We need to use a [Column widget](https://api.flutter.dev/flutter/widgets/Column-class.html) to stack elements.

Example: if you have something like:

```
Column(
    children: [
        Text('Hello'),
        Text('World'),
    ]
)
```

![Source image](/images/disney-plus-2-min.png)

Ok, now ... we will use [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html) to show the bottom navigation. It takes an array of [BottomNavigationBarItem](https://api.flutter.dev/flutter/material/BottomNavigationBarItem-class.html) as its argument.

It will be something like this:

```
Column(
    children: [
    const Divider(color: Colors.white12, height: 0.5, thickness: 0.5),
    BottomNavigationBar(
        items: const <BottomNavigationBarItem>[ ITEMS ],
     ),
    ],
);
```

Besides `items`, we need to set some important properties. Inside BottomNavigationBar, there are three properties:

```
type: BottomNavigationBarType.fixed,
backgroundColor: Colors.transparent,
elevation: 0
```

`Type` has to be `fixed` otherwise background it will be always white and we don't want that.
`BackgroundColor` will be transparent because we want to see the app's background color.
`elevation` will be 0 because we don't want to see the elevation of the bottom navigation. Otherwise, it will have a shadow.

Each BottomNavigationBarItem has a `icon` and `title` property and will be something like this:

```
BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
)
```

The entire bottom navigation will be:

```
  Widget bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Divider(color: Colors.white12, height: 0.5, thickness: 0.5),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ],
    );
  }
```

You must have noticed a property called `mainAxisSize: MainAxisSize.min,` which is used to make the bottom navigation fit the screen.
If you don't use this property, the bottom navigation will be too big and will cover the rest of the screen.

So far, so good ... or ... almost good.

That bottom navigation is not exactly what we want. Pay attention in the last image on the bottom navigation. It is a image, not an icon.
To achieve the desired result, we need to change the icon to a image.

Affortunatly, `icon` property receive a `Widget` as its argument. We need to crete a `CircleAvatar` or .. two `CircleAvatar` to achieve this.

```
CircleAvatar(
    backgroundColor: Colors.white,
    radius: 16,
    child: CircleAvatar(
        backgroundImage: AssetImage(mickeyMouseFace),
        radius: 15,
     ),
    ),
    label: 'Profile',
)
```

The first CircleAvatar will be used to show a big white circle. And the second CircleAvatar will be used to show the image of the user.
The only reason there are two of them is because we want to make the image of the user to be a little bit smaller than the white circle.

```
  Widget bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(color: Colors.white12, height: 0.5, thickness: 0.5),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: CircleAvatar(
                  backgroundImage: AssetImage(mickeyMouseFace),
                  radius: 15,
                ),
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ],
    );
  }
```

Now, we have a perfect bottom navigation.

![Source image](/images/disney-plus-3-min.png)

Let's deep dive into the body of the app.

A good start could be create the carousel. It would be easily if we use a package but it doesn't make sense for learning Flutter.
So, in this occation we are going to use a [PageView](https://api.flutter.dev/flutter/widgets/PageView-class.html) widget.

In order to keep the code clean, we will create a new widget called `CarouselView` to manage our `PageView` and its state. 
Most of widget which have movement will have a `controller` as their argument.

We are going to work with a local and fixed list of images:

```
List<String> images = [
  "https://d23.com/app/uploads/2019/10/00-toy-story-4-az.jpg",
  "https://d23.com/app/uploads/2019/09/1-endgame-az.jpg",
  "https://d23.com/app/uploads/2017/05/1180w-600h_051917_event-cars-3-screening.jpg",
  "https://d23.com/app/uploads/2020/04/1180w-600h_011520-disney-az-frozen2.jpg",
];
```

And this is carousel:

```
PageView.builder(
  controller: _pageController,
  itemCount: images.length,
  pageSnapping: true,
  onPageChanged: (activePage) {},
  itemBuilder: (context, pagePosition) {
    return Image.network(
      images[pagePosition],
    );
  },
),
```

`PageView` has a few important properties like `controller`, `onPageChanged` and `itemBuilder`. There are more but we will only use theese properties.

`Controller` is used to control the movement of the `PageView`. You initialize a `PageController` with a `initialPage` and a `viewportFraction` property.
`viewportFraction` is used to control the size of image, by default is 1.0 but we are going to set on 0.9. Why? Because we want to show the image in the center of the screen bigger than the rest of the images.
`onPageChanged` is used to know when the page has changed.
`itemBuilder` is used to build every image. 

If we execute this code, we will see something like this:

![Source image](/images/disney-plus-4-min.png)

Hmmmm.... something doesn't look right.

Alright, let's do this. We need to add some margin and make the image bigger. To achieve that, we need to change the `itemBuilder` function. 
But before that, we need to get the current page using `onPageChanged` function.

```
onPageChanged: (page) => setState(() => activePage = page)
```

`page` variable is current page, we get it and set it to our `activePage` variable.

Now ... we can change the `itemBuilder` function:

```
itemBuilder: (context, pagePosition) {
  bool isCenterImage = pagePosition == activePage;
  return showImage(images[pagePosition], isCenterImage);
}
```

If `pagePosition` is equal to `activePage` means that the image is the center of the carousel.
So, we need to pass a `isCenterImage` variable to know if the image is the center of the carousel to our function `showImage`.

```
  AnimatedContainer showImage(String image, bool active) {
    double margin = active ? 0 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
```

It is a lot of code, let me explain myself. We need to create a `AnimatedContainer` widget to manage the animation.
This animation will be used to make the image bigger when it is the center of the carousel with a `margin` of 0 and to make it smaller when it is not the center of the carousel with a `margin` of 20.

We will see `AnimatedContainer` in another post, don't worry about it.

So, we have a carousel with images:

```
  List<String> images = [
    "https://d23.com/app/uploads/2019/10/00-toy-story-4-az.jpg",
    "https://d23.com/app/uploads/2019/09/1-endgame-az.jpg",
    "https://d23.com/app/uploads/2017/05/1180w-600h_051917_event-cars-3-screening.jpg",
    "https://d23.com/app/uploads/2020/04/1180w-600h_011520-disney-az-frozen2.jpg",
  ];

  int activePage = 1;
  final _pageController = PageController(viewportFraction: 0.9, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        pageSnapping: true,
        onPageChanged: (page) => setState(() => activePage = page),
        itemBuilder: (context, pagePosition) {
          bool isCenterImage = pagePosition == activePage;
          return showImage(images[pagePosition], isCenterImage);
        },
      ),
    );
  }

  AnimatedContainer showImage(String image, bool active) {
    double margin = active ? 0 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
```

And it looks like this:

![Source image](/images/disney-plus-5-min.png)

---------

Well, we are in the middle of the post, come on!

In this part, we are going to create a new Widget to manage the studio's logos. 

We will use a fixed and a local list of images managed by [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html).

```
static List<String> logos = [
  'https://www.nicepng.com/png/full/23-233994_disney-logo-black-and-white-nba-finals-logo.png',
  'https://www.brandloyalty.com/cache/pixar.8711/pixar-s800x600.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/2560px-Marvel_Logo.svg.png',
  'https://www.freepnglogos.com/uploads/star-wars-logo-31.png',
  'https://cutewallpaper.org/24/national-geographic-logo-png/national-geographic-keith-ladzinski.png',
];
```

The code may be pretty simple but we need to take into account some things.

```
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: logos.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return buildLogo(logos[index]);
      },
    );
  }
```

The above code won't work. Why? Because `ListView` widget needs a *height* value. `ListView` has not a `value` property. 
Instead of that, we need to wrap it using a `SizedBox` and set a *height* property.

```
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: logos.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Image.network(logos[index]);
        },
      ),
    );
  }
```

`physics` property is used to prevent the list from scrolling if it doesn't need to.

And it looks like this:

![Source image](/images/disney-plus-6-min.png)

Something doesn't fit here... Ok, we need to adjust images. 

We need to fixed a height and width to insert image inside and some space beteween them.

Inside `itemBuilder` we are going to build our custom logo.

```
  final startColor = const Color.fromARGB(255, 54, 56, 70);
  final endColor = const Color.fromARGB(255, 39, 41, 53);

  Widget buildLogo(String logo) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white54,
            width: 0.5,
          ),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              startColor,
              endColor,
            ],
          ),
        ),
        child: Image.network(
          logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
```

Let me explain myself, again.

Like I said before, we need to fixed a height and width. To achieve that, we created a `Container`, by the way the most popular widget ever, and set a `height` and `width` property. Also, we set a `margin` property to set a space between logos.
Inside the `Container` we created another container to set a linear gradient background and added rounded corners.
Finally, we added an `Image` as a child.

Here is full code:

```
  static List<String> logos = [
    'https://www.nicepng.com/png/full/23-233994_disney-logo-black-and-white-nba-finals-logo.png',
    'https://www.brandloyalty.com/cache/pixar.8711/pixar-s800x600.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/2560px-Marvel_Logo.svg.png',
    'https://www.freepnglogos.com/uploads/star-wars-logo-31.png',
    'https://cutewallpaper.org/24/national-geographic-logo-png/national-geographic-keith-ladzinski.png',
  ];

  final startColor = const Color.fromARGB(255, 54, 56, 70);
  final endColor = const Color.fromARGB(255, 39, 41, 53);

  const TopStudiosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: logos.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildLogo(logos[index]);
        },
      ),
    );
  }

  Widget buildLogo(String logo) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white54,
            width: 0.5,
          ),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              startColor,
              endColor,
            ],
          ),
        ),
        child: Image.network(
          logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
```

------

Yeah, we almost done. Let's see the next step!.

Well, we have to create a list of movies with horizontal scroll but we know how to do that.
The only different thing is that above list there is a title. So, we are going to need to use a [Column](https://api.flutter.dev/flutter/widgets/Column-class.html) widget.

```
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Recommended for You',
      style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
    ),
    // list of movies,
  ],
)

```

Hey, there is something new here. There is a [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) widget.
Text widget is used to display text and we can change its style using `style` property. In this case, I overwrite the `color` and `fontWeight` properties from the default `subtitle1` style using `copyWith` function.

To do list of movies, it is like before ...

```
SizedBox(
  height: 180,
  child: ListView(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    addAutomaticKeepAlives: true,
    children: covers.map((cover) => buildCover(cover)).toList(),
  ),
)
```

In this case, `height` is set to 180 to make a portrait view. All is almost the same as before, except for `physics` property.
When user scrolls, I want to the list scroll and make an bounce effect. This is why I don't set `physics` property to `ClampingScrollPhysics()`.
By default, `physics` property is `BouncingScrollPhysics()` which is used to make a bounce effect.

![Source image](/images/disney-plus-7-min.png)

------

Finally, one more step and we are done, I promise.

We need to create Hit Movie list... but ... it is similar to the previous one.

If it is similar ... we can reuse the code from the previous step, isn't it?. Of course, we can!. But first, we need to change few things.

To start with, we change the name of the file and widget from `recommended_movies_view` to `movies_view` and `RecommendedMoviesView` to `MoviesView` respectively.

The only two thing that change are: title and list of movies. So, that are our arguments.

```
  const MoviesView({Key? key, required this.title, required this.movies}) : super(key: key);
```

So, in the `home_page.dart` file we pass `title` and `movies` arguments to `MoviesView` widget.

```
  MoviesView(title: 'Recommended for You', movies: covers),
```

To keep it simple, we will use the same list of movies as in the previous step but if you want to see different movies, you can create another list with your favorite movies.

![Source image](/images/disney-plus-8-min.png)

-----

Well, like I promised before, we are done.

The Home page code will be:

```
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kBackgroundColor,
    appBar: const DisneyAppBar(),
    body: ListView(
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      children: [
        const SizedBox(height: 10),
        const CarouselView(),
        const SizedBox(height: 20),
        const TopStudiosView(),
        const SizedBox(height: 20),
        MoviesView(title: 'Recommended for You', movies: covers),
        const SizedBox(height: 20),
        MoviesView(title: 'Hit Movies', movies: covers),
      ],
    ),
    bottomNavigationBar: const DisneyPlusBottomNavigationBar(),
  );
}
```

![Source image](/images/disney-plus-final-min.png)

The full code is available on [Github]().

See you next time!
