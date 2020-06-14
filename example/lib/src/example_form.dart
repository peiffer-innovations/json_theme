import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:flutter/services.dart';
import 'package:static_translations/static_translations.dart';

class ExampleForm extends StatefulWidget {
  ExampleForm({
    Key key,
  }) : super(key: key);

  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String _countryValue;
  bool _phoneNumberMobile;
  String _radioValue;

  @override
  void initState() {
    super.initState();

    _phoneNumberMobile = false;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  void _validate() {
    if (_formKey.currentState.validate() != true) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please correct form errors'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                      validator: (value) => Validator(validators: [
                        RequiredValidator(),
                      ]).validate(
                        context: context,
                        label: 'First Name',
                        value: value,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                      validator: (value) => Validator(validators: [
                        RequiredValidator(),
                      ]).validate(
                        context: context,
                        label: 'Last Name',
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'example@example.com',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validator(validators: [
                  RequiredValidator(),
                  EmailValidator(),
                ]).validate(
                  context: context,
                  label: 'Email',
                  value: value,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) => Validator(validators: [
                  RequiredValidator(),
                  PhoneNumberValidator(),
                ]).validate(
                  context: context,
                  label: 'Phone Number',
                  value: value,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    onChanged: (value) =>
                        setState(() => _phoneNumberMobile = value),
                    value: _phoneNumberMobile,
                  ),
                  Flexible(child: Text('Mobile')),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autocorrect: false,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            errorMaxLines: 1,
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) => Validator(validators: [
                            RequiredValidator(),
                            MinLengthValidator(length: 8)
                          ]).validate(
                            context: context,
                            label: 'Password',
                            value: value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Flexible(
                    child: TextFormField(
                      autocorrect: false,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      obscureText: true,
                      validator: (value) => Validator(validators: [
                        RequiredValidator(),
                        _CustomValidator(
                          (value) => _passwordController.text ==
                                  _confirmPasswordController.text
                              ? null
                              : 'Password fields do not match',
                        ),
                      ]).validate(
                        context: context,
                        label: 'Password',
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                decoration: InputDecoration(
                  hintText: 'Enter your comments...',
                  labelText: 'Comments',
                ),
                maxLength: 200,
                maxLines: 5,
                validator: (value) =>
                    Validator(validators: [MinLengthValidator(length: 10)])
                        .validate(
                  context: context,
                  label: 'Comments',
                  value: value,
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: Text('Country'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _countryValue = value);
                },
                value: _countryValue,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value),
                        value: 'one',
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'One',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value),
                        value: 'two',
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'Two',
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Radio(
                        groupValue: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value),
                        value: 'three',
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'Three',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: Text('Countries (Disabled)'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: null,
                value: null,
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                hint: Text('Countries (Selected; Disabled)'),
                items: _createCountryList().map((String str) {
                  return DropdownMenuItem(
                    value: str,
                    child: Text(
                      str,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: null,
                value: 'United States of America (USA)',
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: true,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 1',
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: false,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 2',
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    onChanged: null,
                    value: false,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 3',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '1',
                    onChanged: null,
                    value: '1',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 1',
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '2',
                    onChanged: null,
                    value: '2',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 2',
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio(
                    groupValue: '3',
                    onChanged: null,
                    value: '3',
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Disabled 3',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Required',
                  labelText: 'Disabled',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: null,
                decoration: InputDecoration(
                  hintText: 'Disabled multiline...',
                  labelText: 'Disabled',
                ),
                enabled: false,
                maxLength: 200,
                maxLines: 5,
                validator: (value) => Validator(
                  validators: [MinLengthValidator(length: 10)],
                ).validate(
                  context: context,
                  label: 'Disabled',
                  value: value,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Enabled'),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Flexible(
                    child: FlatButton(
                      onPressed: null,
                      child: Text('Disabled'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Enabled'),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Flexible(
                    child: RaisedButton(
                      onPressed: null,
                      child: Text('Disabled'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () => _validate(),
                child: Text('Validate'),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _createCountryList() {
    var str = '''Afghanistan
Albania
Algeria
Andorra
Angola
Anguilla
Antigua & Barbuda
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bermuda
Bhutan
Bolivia
Bosnia & Herzegovina
Botswana
Brazil
Brunei Darussalam
Bulgaria
Burkina Faso
Myanmar/Burma
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Cayman Islands
Central African Republic
Chad
Chile
China
Colombia
Comoros
Congo
Costa Rica
Croatia
Cuba
Cyprus
Czech Republic
Democratic Republic of the Congo
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Fiji
Finland
France
French Guiana
Gabon
Gambia
Georgia
Germany
Ghana
Great Britain
Greece
Grenada
Guadeloupe
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
Iran
Iraq
Israel and the Occupied Territories
Italy
Ivory Coast (Cote d'Ivoire)
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kosovo
Kuwait
Kyrgyz Republic (Kyrgyzstan)
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Republic of Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Martinique
Mauritania
Mauritius
Mayotte
Mexico
Moldova, Republic of
Monaco
Mongolia
Montenegro
Montserrat
Morocco
Mozambique
Namibia
Nepal
Netherlands
Zealand
Nicaragua
Niger
Nigeria
Korea, Democratic Republic of (North Korea)
Norway
Oman
Pacific Islands
Pakistan
Panama
Papua Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Puerto Rico
Qatar
Reunion
Romania
Russian Federation
Rwanda
Saint Kitts and Nevis
Saint Lucia
Saint Vincent's & Grenadines
Samoa
Sao Tome and Principe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovak Republic (Slovakia)
Slovenia
Solomon Islands
Somalia
South Africa
Korea, Republic of (South Korea)
South Sudan
Spain
Sri Lanka
Sudan
Suriname
Swaziland
Sweden
Switzerland
Syria
Tajikistan
Tanzania
Thailand
Timor Leste
Togo
Trinidad & Tobago
Tunisia
Turkey
Turkmenistan
Turks & Caicos Islands
Uganda
Ukraine
United Arab Emirates
United States of America (USA)
Uruguay
Uzbekistan
Venezuela
Vietnam
Virgin Islands (UK)
Virgin Islands (US)
Yemen
Zambia
Zimbabwe''';

    return str.split('\n').map((String s) => s.trim()).toList();
  }
}

class _CustomValidator extends ValueValidator {
  _CustomValidator(
    this.validator,
  );

  final String Function(String value) validator;

  @override
  String validate({
    String label,
    Translator translator,
    String value,
  }) =>
      validator(value);

  @override
  Map<String, dynamic> toJson() => {};
}
