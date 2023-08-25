import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}
class FiltersScreen extends StatefulWidget{
   const FiltersScreen({super.key, required this.currentFilters});
   final Map<Filter,bool> currentFilters;

   @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }


}
class _FiltersScreenState extends State<FiltersScreen>{
  var _gluternFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;
  @override
  void initState() {
    
    super.initState();
    _gluternFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _veganFilterSet = widget.currentFilters[Filter.vegetarian]!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Your Filters') ,
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const TabsScreen(),),);
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
          Filter.glutenFree :_gluternFreeFilterSet,
          Filter.lactoseFree:_lactoseFreeFilterSet,
          Filter.vegan:_veganFilterSet,
          Filter.vegetarian:_veganFilterSet

          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(value: _gluternFreeFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _gluternFreeFilterSet = isChecked;
              });
            },
            title: Text('Gluten-Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only Include Gluten Free Meals.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34 ,right: 22),
            ),
              SwitchListTile(value: _lactoseFreeFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
            title: Text('Lactose-Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only Include Lactose Free Meals.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34 ,right: 22),
            )
          ,  SwitchListTile(value: _veganFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: Text('Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only Include Vegan Meals.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34 ,right: 22),
            )
          ,  SwitchListTile(value: _vegeterianFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _vegeterianFilterSet = isChecked;
              });
            },
            title: Text('Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only Include Vegetarian Meals.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34 ,right: 22),
            )
          
          ],
        ),
      ),
    );
  }
}