#include <ruby.h>

VALUE SuperModule = Qnil;
VALUE SuperClass = Qnil;

void Init_super();
VALUE super_initialize(VALUE self);
VALUE super_add(VALUE self, VALUE num1, VALUE num2);
VALUE super_loops(VALUE self, VALUE arr1, VALUE arr2, VALUE arr3);

void Init_super() {
    SuperModule = rb_define_module("Super");
    SuperClass = rb_define_class_under(SuperModule, "Super", rb_cObject);
    rb_define_method(SuperClass, "initialize", super_initialize, 0);
    rb_define_method(SuperClass, "add", super_add, 2);
    rb_define_method(SuperClass, "arr_mult", super_loops, 3);
}

VALUE super_initialize(VALUE self) {
    rb_iv_set(self, "@var", rb_hash_new());
    return self;
}

VALUE super_add(VALUE self, VALUE num1, VALUE num2) {
  int sum = NUM2INT(num1) + NUM2INT(num2);
  return INT2NUM(sum);
}

VALUE super_loops(VALUE self, VALUE arr1, VALUE arr2, VALUE arr3) {
  int arr1_val, arr2_val, arr3_val, val;
  VALUE result_array = rb_ary_new2(RARRAY_LEN(arr1)*RARRAY_LEN(arr2)*RARRAY_LEN(arr3));

  for (int i = 0; i < RARRAY_LEN(arr1); i++) {
    for (int j = 0; j < RARRAY_LEN(arr2); j++) {
      for (int k = 0; k < RARRAY_LEN(arr3); k++) {
	arr1_val = NUM2INT(rb_ary_entry(arr1, i));
	arr2_val = NUM2INT(rb_ary_entry(arr2, j));
	arr3_val = NUM2INT(rb_ary_entry(arr3, k));
	val = arr1_val*arr2_val*arr3_val;
	rb_ary_push(result_array, INT2NUM(val));
      }
    }
  }

  return result_array;
}
