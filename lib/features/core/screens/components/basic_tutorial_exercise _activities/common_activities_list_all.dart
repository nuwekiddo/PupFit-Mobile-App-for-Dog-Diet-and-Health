// ignore_for_file: non_constant_identifier_names

class CommonActivities {
  int commActId;
  String title;
  String image;
  String cover;
  String desc;
  String categ;
  String benefits;
  String step1;
  String step2;
  String step3;
  String step4;
  String step5;

  CommonActivities({
    required this.commActId,
    required this.title,
    required this.image,
    required this.cover,
    required this.desc,
    required this.categ,
    required this.benefits,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
    required this.step5,
  });

  static List<CommonActivities> commonAct1 = [
    CommonActivities(
        commActId: 0,
        title: 'Walking',
        image: 'assets/images/dog-walking.gif',
        cover: 'assets/images/walkignDogOwner.jpg',
        desc:
            'Walking your dog regularly provides a basic foundation for physical and mental health.',
        benefits:
            'Dog walking can be an effective way to reduce stress, anxiety and depression. Walking your dog can provide a calming effect and help clear your head. Regularly walking your dog helps to keep your body and your dogs body healthy. Walking can help to improve your cardiovascular fitness, stamina and muscle strength.',
        step1:
            'Prepare the necessary supplies: a leash, an adjustable collar, treats, and a waste bag and Attach the leash to the collar, and ensure the collar is properly adjusted. ',
        step2:
            'Lead the dog outside and start the walk. Encourage the dog to stay close to you and reward them with a treat whenever they do.',
        step3:
            'Keep an eye out for any signs of discomfort, such as excessive panting or limping and make sure to stop occasionally to give your dog a chance to rest and take in their surroundings. ',
        step4:
            'If your dog relieves themselves, pick up the waste and dispose of it properly. ',
        step5:
            'Once the walk is over, reward your dog with a treat and praise them for a job well done.',
        categ: 'Beginner '),
    CommonActivities(
        commActId: 1,
        title: 'Running',
        image: 'assets/images/dog-run.gif',
        cover: 'assets/images/dog-run-jpg.jpg',
        desc:
            'Dog running is an excellent way to provide physical and mental stimulation for your pup.',
        benefits:
            "Running can help reduce anxiety and stress in both you and your dog. It can help to keep your dogs weight and muscle tone in checkand a great way to socialize your dog with other people and animals.",
        step1:
            'Find a safe, open area suitable for running with your dog. Make sure it is away from roads and other dangers.',
        step2:
            'Warm up your dog with some light walking before starting to run. Start off slow and gradually increase the speed to a comfortable pace for both you and your dog.',
        step3:
            'If your dog is feeling tired, take regular breaks to allow them to recover before continuing. Monitor your dog for signs of fatigue or distress.',
        step4:
            'Once you’re finished, reward your dog with a treat and some playtime. ',
        step5: 'Cool down your dog with a light walk before heading home.',
        categ: 'Intermediate '),
    CommonActivities(
        commActId: 2,
        title: 'Swimming',
        image: 'assets/images/dog-swim.gif',
        cover: 'assets/images/dogSwim.jpg',
        desc:
            'Dog swimming provides a social relationship for you and for your dog.',
        benefits:
            'Swimming is a great form of exercise that can help to keep your dog healthy and fit and also a great way to keep your dog cool in the summer.',
        step1:
            'Start off slowly by introducing your dog to the water. Take them to a shallow area and let them splash and get used to the feeling of the water around them.',
        step2:
            'Once your dog is comfortable with the water, start teaching them to swim. Start with basic commands like “sit” and “stay” and then progress to commands like “swim” and “fetch”.',
        step3:
            'As your dog gets more comfortable with swimming, you can start to introduce toys and other items into the water. This will help them to become more confident in the water and will help them to build endurance. ',
        step4:
            'Once your dog is comfortable with swimming, you can start to teach them more advanced swimming techniques like retrieving objects and swimming in deeper water.',
        step5:
            'Regular swimming sessions will help to keep your dog fit and healthy and will also help to strengthen the bond between you and your pet.',
        categ: 'Advance '),
    CommonActivities(
        commActId: 3,
        title: 'Fetching',
        image: 'assets/images/dog-fetch.gif',
        cover: 'assets/images/dogfetch.jpg',
        desc:
            'Fetching activity can help strengthen the bond between an owner and their pet, as well as providing physical and mental stimulation.',
        benefits:
            'Fetch is a great way for your dog to get exercise, build muscle, and stay mentally stimulated. It also helps strengthen the bond between you and your pet, as well as teaching them important obedience skills. Finally, playing fetch can help reduce boredom, stress, and destructive behavior in dogs.',
        step1:
            'Gather your supplies: a leash, a collar, treats, and your dogs favorite toys. Take your dog outside and make sure the area is safe.',
        step2:
            'Attach the leash to the collar and make sure it is secure. Show your dog the toy.',
        step3:
            'Throw the toy a short distance away from your dog. Encourage your dog to go get the toy and admire them when they do.',
        step4:
            'Allow your dog to bring the toy back to you and reward them with a treat. Repeat the game several times until your dog gets tired or bored.',
        step5:
            'Once the game is over, take the toy away and put it away for next time. Give your dog lots of love and praise for a job well done!',
        categ: 'Advance '),
  ];
}
