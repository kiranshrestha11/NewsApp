import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/provider/user_data_provider.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/home/home_page.dart';
import 'package:news_app/views/profile_page/profile_section_i.dart';
import 'package:news_app/views/profile_page/profile_section_ii.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _user = ref.watch(userDataProvider);
    final String str =
        "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Kiran Shrestha",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  _prefs.clear();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ))
          ]),
      body: Center(
        child: _user.when(
            data: (_data) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 68,
                    backgroundColor: kPrimaryColor,
                    child: CircleAvatar(
                      radius: 66.5,
                      backgroundImage: NetworkImage(str),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "#A2E00431",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(_data.email, style: TextStyle(fontSize: 17)),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Share your Bio.", style: TextStyle(fontSize: 13)),
                  SizedBox(
                    height: 24,
                  ),
                  ProfileSectionI(),
                  SizedBox(
                    height: 24,
                  ),
                  ProfileSectionII()
                ],
              );
            },
            error: (s, e) => Text(e.toString()),
            loading: () => Center(child: const CircularProgressIndicator())),
      ),
    );
  }
}
