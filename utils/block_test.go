package utils

import (
	"reflect"
	"testing"
)

func TestBlock_GetBytes(t *testing.T) {
	type fields struct {
		Hi uint64
		Lo uint64
	}
	tests := []struct {
		name   string
		fields fields
		want   []byte
	}{
		{"test 1", fields{0,0}, []byte{1}},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			u := Block{
				Hi: tt.fields.Hi,
				Lo: tt.fields.Lo,
			}
			if got := u.GetBytes(); !reflect.DeepEqual(got, tt.want) {
				t.Errorf("GetBytes() = %v, want %v", got, tt.want)
			}
		})
	}
}
