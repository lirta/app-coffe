part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: HEADRE
        Container(
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              return Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: accentHitam, width: 1)),
                    child: Stack(
                      children: <Widget>[
                        SpinKitFadingCircle(
                          color: accentBiru,
                          size: 50,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == ""
                                      ? AssetImage("assets/kopi.png")
                                      : NetworkImage(
                                          userState.user.profilePicture)),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            78,
                        child: Text(
                          userState.user.name,
                          style: biruTextFont.copyWith(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: "id ID",
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(userState.user.balance),
                        style: biruNumberFont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: accentHitam,
                size: 50,
              );
            }
          }),
        )
      ],
    );
  }
}
